def my_map(arr, &prc)
    map_arr = []
    arr.each {|num| map_arr << prc.call(num)}
    map_arr
end

def my_select(arr, &prc)
    sel_arr = []
    arr.each{|num| sel_arr << num if prc.call(num)}
    sel_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each{|num| count += 1 if prc.call(num)}
    count
end

def my_any?(arr, &prc)
    arr.each{|num| return true if prc.call(num)}
    return false
end

def my_all?(arr, &prc)
    arr.each{|num| return false if !prc.call(num)}
    return true
end

def my_none?(arr, &prc)
    arr.each{|num| return false if prc.call(num)}
    return true
end
