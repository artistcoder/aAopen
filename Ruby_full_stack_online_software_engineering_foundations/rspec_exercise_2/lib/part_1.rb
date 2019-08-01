def partition(arr, num)
    less_than = []
    greater_equal = []
    final = []
    arr.each do |n|
        if n < num
            less_than << n
        else
            greater_equal << n
        end
    end
    final.push(less_than, greater_equal) 
end

def merge(hash_1,hash_2)
    final_hash = Hash.new(0)
    hash_1.each do |k,v|
        if !hash_2.has_key?(k)
            final_hash[k] = v
        end
    end
    hash_2.each do |k,v|
        final_hash[k] = v
    end
    final_hash
end

def censor(str, arr)
    vowels = "aeiouAEIOU"
    new_str = []
    str.split.each do |word|
        if arr.include?(word.downcase)
            new_word = ""
            word.each_char do |let|
                if vowels.include?(let)
                    new_word += "*"
                else
                    new_word += let
                end
            end
            new_str << new_word
        else
            new_str << word
        end
    end
    new_str.join(" ")
end

def power_of_two?(n)
    if n == 1
        return true
    end
    (1...n).inject do |tot,ele|
        if tot < n 
            tot * 2
        elsif tot == n
            return true
        else
            return false
        end
    end
end
