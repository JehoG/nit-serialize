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
	print "hello from generated method"
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
end
