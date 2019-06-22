def average(num_1, num_2)
    (num_1 + num_2)/2.0
end

def average_array(arr)
    arr.inject{|res, ele| res + ele}/(arr.length*1.0)
end

def repeat(str, num)
    new_str = ""
    num.times{new_str += str}
    new_str
end

def yell(str)
    str.upcase! + "!"
end

def alternating_case(str)
    str.downcase!
    arr = str.split
    arr.each_with_index do |word,idx|
        if idx.even?
            word.upcase!
        end
    end
    arr.join(" ")
end



p average(2,4)
p average_array([2,3,4,5,6])
p repeat("help",5)
p yell("o")
p alternating_case("it is I THE MASTER of the UNIVERSE")