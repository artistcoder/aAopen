# Know how to reason about recursive programs
# Be able to write a base case for a recursive method
# Be able to write the inductive step for a recursive method
# Be able to explain the benefits of writing a method recursively vs. iteratively
# ---> less variables to be defined. less lines of code
# Be able to trace a recursive method and figure out how many recursive steps it will take
# Know how to write recursive sorting and searching algorithms


# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in 
# that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(first, last)
    return [] if last < first
    return first if last == first
    [last].unshift(range(first, last - 1)).flatten
end

def range_it(first,last)
    return [] if last < first
    arr = []
    while first <= last
        arr.unshift(last)
        last -= 1
    end
    arr
end

# p range(5,20)
# p range_it(5,20)


# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def exp_1(b, n)
   return 1 if n == 0
   b * exp_1(b, n - 1)
end

def exp_2(b,n)
    return 1 if n == 0
    return b if n == 1
    if n.odd?
        b * (exp_2(b, (n - 1) / 2) ** 2)
    else
        exp_2(b, n/2) ** 2
    end
end

# If the n == 256, about how many nested recursive steps will we run in the first case?
#----256
# How deep will we need to recurse for the second? 
#------->9
# 256 --> 128 ---> 64 ----> 32 ---> 16 --> 8 ---> 4 --->2 ---->1

# Using recursion and the is_a? method, write an 
# Array#deep_dup method that will perform a "deep" duplication of t
# he interior arrays.
#[1, [2], [3, [4]]].
Class Array

    def deep_dup
        return self[0] if self.length == 1
        temp_arr.each do |ele|
            [].unshift(self.deep_dup)
        end

    end

end

old_arr = [1, [2], [3, [4]]]
new_arr = old_arr.deep_dup
new_arr << "I AM NEW"
p "i am old array: #{old_arr}"
p "i am new array: #{new_arr}"
