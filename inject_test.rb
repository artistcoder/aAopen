def inject_test(num)
    (0..num).inject do |res,ele|
        res + ele
        p "acc is:" + res.to_s
        p "acc object id is " + res.object_id.to_s
        res.to_i
        # p ele
        # p ele.object_id
    end
end

p inject_test(3)