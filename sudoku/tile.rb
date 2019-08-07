require 'colorize'

class Tile
    
    attr_reader :value
    attr_accessor :given

    def initialize
        @value = ""
        @given = false
    end

    def value=(new_value)
        if !self.given
            @value = new_value
        else
            puts "!!! Error. Try again. Given value cannot be overwritten !!!"
        end
    end

 
end
