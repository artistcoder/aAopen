class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name|
      getter_method = name.to_s
      setter_method = name.to_s + "="
      instance_variable = "@" + name.to_s

      define_method(getter_method) {
          instance_variable_get(instance_variable)
        }
      define_method(setter_method) do |value|
          instance_variable_set(instance_variable,value)
      end
      
    end
   
  end
end
