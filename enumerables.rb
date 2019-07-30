class Array
    def my_each(&prc)
        self.length.times do |idx|
            prc.call(self[idx])
        end
        self
    end
# Now extend the Array class to include my_select that takes a
#  block and returns a new array containing only elements
#   that satisfy the block. Use your my_each method!

    def my_select(&prc)
        selected = []
        self.my_each do |element|
            selected << element if prc.call(element)
        end
        # self.length.times do |idx|
        #     if prc.call(self[idx])
        #         selected << self[idx]
        #     end
        # end
        selected
    end

    # Write my_reject to take a block 
    # and return a new array excluding elements 
    # that satisfy the block.
    def my_reject(&prc)
        rejects = []
        self.my_each do |ele|
            rejects << ele if !prc.call(ele)
        end
        rejects
    end

    # Write my_any? to return true if any elements of the array satisfy the block 
    # and my_all? to return true only if all elements satisfy the block.

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end
        return false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end
        return true
    end

end

# my_flatten should return all elements of the array into a new, 
# one-dimensional array. Hint: use recursion!

def my_flatten
    return self if self.flatten == self
    new_arr = []
    self.each do |ele|
        if ele.kind_of?(Array)
            ele.length.times{new_arr << ele.shift}
        else
            new_arr << ele
        end
    end
    new_arr.my_flatten
end

# Write my_zip to take any number of arguments. It should 
# return a new array containing self.length elements. Each element of the 
# new array should be an array with a length of the input arguments + 1 and contain 
# the merged elements at that index. If the size of any argument is less than self, 
# # nil is returned for that location.
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
#args = [[4,5,6],[7,8,9]]
def my_zip(*args)
    
end

# My Join
# my_join returns a single string containing all 
# the elements of the array, separated by the given string separator.
#  If no separator is given, an empty string is used.

# My Rotate
# Write a method my_rotate that returns a new array containing all the elements of the original array in a rotated order. 
# By default, the array should rotate by one element. If a negative value is given,
#  the array is rotated in the opposite direction.

def my_rotate(rotates = 1)

end


def my_join(sep = "")
    str = ""
    self.each do |char|
        str += char + sep
    end
    str[0..-2]
end

def my_reverse
    reverse = []
    self.length.times{reverse << self.pop}
    reverse
end
