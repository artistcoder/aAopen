# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
#require "byebug"

def largest_prime_factor(num)
    # should return the largest divisor of the number that is also a prime number
    factor_array = []
    (2..num).each do |factor|
        if num % factor == 0
            factor_array << factor
        end
    end
    prime_array = factor_array.select{|n| prime?(n)}
    prime_array[-1]
end

def prime?(num)
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end


def unique_chars?(str)
    char_hash = Hash.new(0)
    str.each_char{|char| char_hash[char] += 1}
    char_hash.each do |k,v|
        if v > 1
            return false
        end
    end
    true
end

def dupe_indices(arr)
    ele_hash = Hash.new(0)
    dupe_hash = {}
    arr.each{|ele| ele_hash[ele] += 1}

    ele_hash.each do |k,v|
        idx_array = []
        if v > 1
            arr.each_with_index do |ele2, idx|
                if k == ele2
                    idx_array << idx
                end
            end
        dupe_hash[k] = idx_array
        end
    end
    dupe_hash
end

def ana_array(arr_1,arr_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)
    arr_1.each{|ele1| hash_1[ele1] += 1}
    arr_2.each{|ele2| hash_2[ele2] += 1}

    hash_1 == hash_2
end

