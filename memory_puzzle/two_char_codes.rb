alphabet = "abcdefghijklmnopqrstuvwxyz"
two_char_codes = []

alphabet.each_char do |char_1|
    alphabet.each_char do |char_2|
        two_char_codes << char_1 + char_2
    end
end

p two_char_codes


