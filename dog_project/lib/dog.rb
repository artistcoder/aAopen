require "byebug"
class Dog

    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end
    def name=(string)
        @name = string
    end

    def breed
        @breed
    end
    def breed=(string)
        @breed = string
    end
    
    
    def age
        @age
    end
    def age=(num)
        @age = num
    end

    def bark
        if @age > 3
            @bark.upcase
        else
            @bark.downcase
        end
    end
    def bark=(string)
        @bark = string
    end

    def favorite_foods
        @favorite_foods
    end
    def favorite_foods=(arr)
        @favorite_foods = arr
    end

    def favorite_food?(str)
        @favorite_foods.map(&:downcase).include?(str.downcase)
    end
end
