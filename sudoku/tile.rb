require 'colorize'

class Tile
    
    attr_reader :value
    attr_accessor :given

    def initialize
        @value = ""
        @given = false
    end

    def color_given_numbers(value)
       value.colorize(:magenta) if self.given
    end

    def value=(new_value)
        if !self.given
            @value = new_value
        else
            print "Try again. Given value cannot be overwritten"
    end

 
end
