import serialization

class Foobar
	serialized

	var attr_a: String
	#var attr_d: nullable String

end

var a = new Foobar("test")
#a.serialize
print a.attr_a
