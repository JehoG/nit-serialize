# This file is part of NIT ( http://www.nitlanguage.org ).
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module serialization_phase

import modelize_property
import parser_util
import simple_misc_analysis
import serialization

redef class ToolContext
	var serialization_phase: Phase = new SerializationPhase(self, [modelize_property_phase])
end

redef class APropdef
	# Visit the module to compute the real value of the literal-related node of the AST.
	# Warnings and errors are displayed on the toolcontext.
	fun do_literal(toolcontext: ToolContext)
	do
		var v = new LiteralVisitor(toolcontext)
		v.enter_visit(self)
	end
end

private class LiteralVisitor
	super Visitor

	var toolcontext: ToolContext

	init(toolcontext: ToolContext)
	do
		self.toolcontext = toolcontext
	end

	redef fun visit(n)
	do
		n.accept_literal(self)
		n.visit_all(self)
	end
end

redef class ANode
	private fun accept_literal(v: LiteralVisitor) do end
end

redef class AStringFormExpr
	# The value of the literal string once computed.
	var value: nullable String
	redef fun accept_literal(v)
	do
		var txt = self.n_string.text
		var skip = 1
		if txt[0] == txt[1] and txt.length >= 6 then skip = 3
		self.value = txt.substring(skip, txt.length-(2*skip)).unescape_nit
	end
end

private class SerializationPhase
	super Phase

	init(toolcontext, depends)
	do
		# FIXME The phase has to be executed just after `modelize_property_phase`
		# But there is no simple way to express this
		# So, for the moment, I just looked at the linearization and see what phase is after `modelize_property_phase`
		# And inserted before it
		toolcontext.phases.add_edge(toolcontext.simple_misc_analysis_phase, self)
    end

	redef fun process_annotated_node(npropdef, nat)
	do
		# Skip if we are not interested
		if nat.n_atid.n_id.text != "serialized" then return

		var modelbuilder = toolcontext.modelbuilder

		if not npropdef isa AStdClassdef then
			modelbuilder.error(npropdef, "Syntax error: only a concrete class can be serialized.")
			return
		end

		var mclassdef = npropdef.mclassdef.as(not null)
		var mpropdefs = mclassdef.mpropdefs

		var location = npropdef.location
		var serialize_mmethdef = new MMethodDef(mclassdef, new MMethod(mclassdef, "serialize", private_visibility), location)
		serialize_mmethdef.msignature = new MSignature(new Array[MParameter], null)
		var code = """
			fun serialize do
				var o = new SerializedObject
		"""

		for method in mpropdefs do
			if method isa MAttributeDef then
				var mtype = method.static_mtype.as(not null)
				if mtype.to_s.has_all("nullable ") then
					modelbuilder.error(npropdef, "Syntax error: serializing a nullable attribut isn't supported yet.")
					return
				end

				var name = method.mproperty.name.substring_from(1)
				code = code + "o.add_element(\"{name}\", {name})\n"
			end
		end

		code = code + "\nend"

		var literal_visitor = new LiteralVisitor(toolcontext)
		var serialize_propdef = toolcontext.parse_propdef(code)
		serialize_propdef.do_literal(toolcontext)
		associate_propdef(serialize_mmethdef, serialize_propdef)
	end

	# Detach `n` from its original AST and attach it to `m` (and its related AST)
	# `n` must not be already attached to an existing model entity
	# `m` must not be already attached to an existing AST node
	fun associate_propdef(m: MPropDef, n: APropdef)
	do
		# FIXME: the model-AST relations **must** be rationalized:
		# * 1- fragility: the risk of inconsistencies is too hight
		# * 2- complexity: there is too much paths to access the same things

		# Easy attach
		assert n.mpropdef == null
		n.mpropdef = m

		# Required to so that look-for implementation works
		assert not toolcontext.modelbuilder.mpropdef2npropdef.has_key(m)
		toolcontext.modelbuilder.mpropdef2npropdef[m] = n

		var mclassdef = m.mclassdef
		var nclassdef = toolcontext.modelbuilder.mclassdef2nclassdef[mclassdef]
		# Sanity checks
		assert nclassdef.mclassdef == mclassdef

		# Required so that propdef are visited in visitors
		if not nclassdef.n_propdefs.has(n) then nclassdef.n_propdefs.add(n)
	end

end
