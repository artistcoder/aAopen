class Tile

    attr_accessor :value, :num_of_surrounding_bombs

    def initialize
        @clicked = false
        @value = "*"
        @num_of_surrounding_bombs = 0
    end

    def inspect
        @value.inspect
        @num_of_surrounding_bombs.inspect
    end

end
