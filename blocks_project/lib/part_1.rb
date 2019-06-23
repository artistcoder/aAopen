
require "byebug"
# select_even_nums
#     should accept an array of numbers as an arg (FAILED - 1)
#     should return an array containing only the even numbers (FAILED - 2)
#     should use Array#select (FAILED - 3)
def select_even_nums(arr)
    arr.select(&:even?)
end
#   reject_puppies
#     should accept an array of dog hashes as an arg (FAILED - 4)
#     should return an array containing the dogs that are older than 2 years (FAILED - 5)
#     should use Array#reject (FAILED - 6)

def reject_puppies(arr)
    arr.reject{|hash| hash["age"] <= 2}
end


#   count_positive_subarrays
#     should accept a 2D array as an arg (FAILED - 7)
#     should return the number of subarrays whose elements sum to a positive quantity (FAILED - 8)
#     should use Array#count (FAILED - 9)
def count_positive_subarrays(two_d_arr)
    #debugger
    # ([[-2, 5], [1, -9, 1], [4, 7]]).count(*(any args))
    two_d_arr.map(&:sum).count(&:positive?)
end

#   aba_translate
#     should accept a word string as an arg (FAILED - 10)
#     should transform the word by putting a 'b' after every vowel and adding that same vowel (FAILED - 11)
def aba_translate(str)
    vowel = "aeiou"
    b_arr = str.split("").map do |char|
        if vowel.include?(char.downcase)
            char + "b" + char
        else
            char
        end
    end
    b_arr.join("")
end

#   aba_array
#     should accept an array of words as an arg (FAILED - 12)
#     should return a new array where every word has been 'aba translated' (FAILED - 13)
#     should use Array#map (FAILED - 14)
#     should use your previous aba_translate method (FAILED - 15)

def  aba_array(arr)
end
