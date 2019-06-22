# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.

def only_vowels?(str)
    vowels = "aeiou"
    str_arr = str.split("")
    str_arr.all?{|let| vowels.include?(let)}
    # str.each_char do |let|
    #     if vowels.include?(let) != true
    #         return false
    #     end
    # end

    # return true
end


p only_vowels?("aaoeee")  # => true
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


