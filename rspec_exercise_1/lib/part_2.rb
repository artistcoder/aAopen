def hipsterfy(str)
    vowel = "aeiou"
    index = -1
    str.each_char.with_index do |let,idx|
        if vowel.include?(let)
            index = idx
        end
    end
    if index == -1
        str
    else
        str = str[0..index-1] + str[index+1..-1]
    end

end

def vowel_counts(str)
    vowels = "aeiou"
    str.downcase!
    vowel_hash = Hash.new(0)
    str.each_char do |let|
        if vowels.include?(let)
            vowel_hash[let] += 1
        end
    end
    vowel_hash
end

def caesar_cipher(str, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str= ""
    str.each_char.with_index do |let, idx|
        if alphabet.include?(let)
            new_str += alphabet[(alphabet.index(let) + n) % 26]
        else
            new_str += let
        end
    end
    new_str
end
