# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(num_1,num_2)
    (2..num_1).none?{|fac| num_1 % fac == 0 && num_2 % fac == 0}
end

# #store divisors of num1 in an array.
#     div1 = divisors(num_1)
#     div2 = divisors(num_2)

#     if div1.length < div2.length
#         div1.each do |ele|
#             if div2.include?(ele)
#                 return false
#             end
#         end
#     else
#         div2.each do |ele|
#             if div1.include?(ele)
#                 return false
#             end
#         end
#     end

#     return true

# end

# def divisors(num)
#     arr = []    
#     (2..num).each do |n|
#         if num % n == 0
#             arr << n
#         end
#     end
#     return arr
# end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
