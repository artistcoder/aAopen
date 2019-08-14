class Array
    def deep_dup
        new_arr= []
        self.each do |element|
            if element.is_a? Integer
                new_arr << element 
            else
                new_arr << element.deep_dup
            end
        end
        new_arr
    end
end

a = [[1,2],[9,10]]
d = a.dup
dd = a.deep_dup


a[0] << 3
p a,d,dd