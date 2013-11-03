import serialization

class Foobar
	serialized

	var attr_a: String
	var attr_b: Int
	var attr_c: Float
	#var attr_d: nullable String

end

var a = new Foobar("test", 123, 456.123)
a.serialize
