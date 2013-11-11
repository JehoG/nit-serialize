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

import phase
import parser_util

redef class ToolContext
	var serialization_phase: Phase = new SerializationPhase(self, null) #[auto_super_init_phase, typing_phase])
end


private class SerializationPhase
	super Phase

	init(toolcontext, depends)
	do
		# FIXME The phase has to be executed just after `modelize_property_phase`
		# But there is no simple way to express this
		# So, for the moment, I just looked at the linearization and see what phase is after `modelize_property_phase`
		# And inserted before it
        #   		toolcontext.phases.add_edge(toolcontext.transform_phase, self)
    end

	redef fun process_annotated_node(npropdef, nat)
	do
		# Skip if we are not interested
		if nat.n_atid.n_id.text != "serialized" then return

		#var modelbuilder = toolcontext.modelbuilder

        print "fuck"
		if not npropdef isa AStdClassdef then
			toolcontext.error(npropdef.location, "Syntax error: only a concrete class can be serialized.")
			return
		end
        var npropdefs = npropdef.n_propdefs

		var code = """
fun serialize: SerializedObject 
do
    var o = new SerializedObject
"""

		for method in npropdefs do
			if method isa AAttrPropdef then
				var ntype = method.n_type.as(not null)
				if ntype.to_s.has_all("nullable ") then
					toolcontext.error(npropdef.location, "Syntax error: serializing a nullable attribut isn't supported yet.")
					return
				end
                
                var name
                if method.n_id is null then 
                    name = method.n_id2.text
                else 
                    name = method.n_id.text
                end
#				var name = method.mproperty.name.substring_from(1)
				code = code + "    o.add_element(\"{name}\", {name})\n"
			end
		end

        code = code + "\n    return o\nend"
        
        # Create method Node and add it to the AST
        var nnewmeth: APropdef = toolcontext.parse_propdef(code)
        print code
        print nnewmeth
        print nnewmeth.collect_tokens_by_text(code)
        print nnewmeth.n_propdefs
        npropdefs.push(nnewmeth)

        print npropdefs
        
        #        npropdefs = npropdef.n_propdefs

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
