require "byebug"
#   all_words_capitalized?
#     should accept an array of words as an arg (FAILED - 1)
#     should use Array#all? (FAILED - 2)
#     when all words are properly capitalized (first letter of word uppercase, other letters lowercase)
#       should return true (FAILED - 3)
#     when at least one word is not capitalized
#       should return false (FAILED - 4)
def all_words_capitalized?(arr)
    arr.all? {|word| word[0].upcase == word[0] && word[1..-1].downcase == word[1..-1]}
end

#   no_valid_url?
#     should accept an array of urls as an arg (FAILED - 5)
#     should use Array#none? (FAILED - 6)
#     when none of the urls end in '.com', '.net', '.io', or '.org'
#       should return true (FAILED - 7)
#     when at least one of the urls end in '.com', '.net', '.io', or '.org'
#       should return false (FAILED - 8)
def no_valid_url?(arr)
    #debugger
    options = [".com", ".net", ".io", ".org"]
    arr.none? do |url|
        options.any?{|suffix| url.end_with?(suffix)}  
    end
end

def any_passing_students?(arr)
    arr.any? do |hash|
        (hash[:grades].sum / hash[:grades].length) >= 75
    end

end

#   any_passing_students?
#     should accept an array of student hashes as an arg (FAILED - 9)
#     should use Array#any? (FAILED - 10)
#     when at least one student has an average grade of 75 or higher
#       should return true (FAILED - 11)
#     when no student has an average grade of 75 or higher
#       should return false (FAILED - 12)
