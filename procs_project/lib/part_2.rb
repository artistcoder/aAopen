def reverser(str, &prc)
    prc.call(str.reverse!)
end

def word_changer(str, &prc)
    str.split.map{|word| prc.call(word)}.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        prc1.call(num)
    else
        prc2.call(num)
    end
end

def and_selector(arr, prc1, prc2)
    arr.select{|num| prc1.call(num) && prc2.call(num)}
end

def alternating_mapper(arr, prc1, prc2)
    arr.map.with_index do |num, idx|
        if idx.even?
            prc1.call(num)
        else
            prc2.call(num)
        end
    end
end

