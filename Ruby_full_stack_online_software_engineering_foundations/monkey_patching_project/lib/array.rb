# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    #   #span
    #     when the array contains numbers as elements
    #       should return the difference between the largest and smallest element (FAILED - 1)
    #     when the array is empty
    #       should return nil (FAILED - 2)
    def span
        if self.length > 0
            self.max - self.min
        else
            nil
        end
    end

    #   #average
    #     when the array contains numbers as elements
    #       should return a number representing the average value of the elements (FAILED - 3)
    #     when the array is empty
    #       should return nil (FAILED - 4)
    def average
        if self.length > 0
            return self.sum / (self.length * 1.0)
        else
           return nil
        end
    end
p [4, 7, 13, 5].average
    #   #median
    #     when there is an odd number of elements
    #       should return the middle element of the array when sorted (FAILED - 5)
    #     when there is an even number of elements
    #       should return the average of the two middle elements when sorted (FAILED - 6)
    #     when the array is empty
    #       should return nil (FAILED - 7)
    def median
        return nil if self.length == 0 
        sorted = self.sort
        length = self.length
        if length % 2 != 0
            return sorted[length/2]
        else
            return (sorted[length/2] + sorted[(length/2) - 1])/2.0
        end
    end
    #   #counts
    #     should return a hash representing the count of each element of the array (FAILED - 8)
    def counts
         count = Hash.new(0)
         self.each{|ele| count[ele] += 1}
         count
    end

    # PART 2
    #   #my_count
    #     should accept any value as an argument and return the number of times that value appears in the array (FAILED - 9)
    #     should not use the built-in Array#count (FAILED - 10)
    def my_count(val)
        counter = 0
        self.each do |ele|
            if ele == val
                counter += 1
            end
        end
        counter
    end

    #   #my_index
    #     should accept any value as an argument and return the index where that element is found in the array (FAILED - 11)
    #     should not use the built-in Array#index (FAILED - 12)
    #     when the value appears multiple times in the array
    #       should return the smallest index where it is found (FAILED - 13)
    #     when the value does not appear in the array
    #       should return nil (FAILED - 14)
    def my_index(arg)
        self.each_with_index do |ele,idx|
            if ele == arg
                return idx
            end
        end
        return nil
    end

    #   #my_uniq
    #     should return a new array without duplicate elements in the order they first appeared in the original array (FAILED - 15)
    #     should not use the built-in Array#uniq (FAILED - 16)
    def my_uniq
        unique = []
        self.each do |ele|
            unique << ele if !unique.include?(ele)
        end
        unique
    end

    #   #my_transpose
    #     should transpose a 2D array with square dimensions by returning a new 2D array where the horizontal rows are converted to vertical columns (FAILED - 17)
    #     should not use the built-in Array#transpose (FAILED - 18)
    def my_transpose
        transpose_arr = Array.new(self.length){Array.new(self.length)}
        self.each_with_index do |arr, idx1|
            arr.each_with_index do |ele, idx2|
                transpose_arr[idx2][idx1] = ele
            end
        end
        transpose_arr
    end

end
