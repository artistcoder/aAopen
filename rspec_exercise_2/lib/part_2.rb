def palindrome?(str)
    end_index = str.length - 1
    start_index = 0
    while start_index < (str.length/2)
        if str[start_index] != str[end_index]
            return false
        end
        start_index += 1
        end_index -= 1
    end
    return true
end

def substrings(str)
    sub_array = []
    str.each_char.with_index do |char_1, start_index|
        str.each_char.with_index do |char_2, end_index|
            if end_index >= start_index
                sub_array << str[start_index..end_index]
            end
        end
    end
    sub_array
end

def palindrome_substrings(str)
    substring = substrings(str)
    substring.select{|word| palindrome?(word) && word.length > 1}
end
