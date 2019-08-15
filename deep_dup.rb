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

a = [4,5,6]
d = a.dup
dd = a.deep_dup


a[0] = 3
p a,d,dd