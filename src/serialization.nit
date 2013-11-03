class SerializedObject
	var objects = new ArrayMap[String, Object]

	fun add_element(name: String, value: Object) do
		objects[name] = value
	end
end


