class Tile

    attr_accessor :value, :num_of_surrounding_bombs, :clicked, :neighbors, :fringe, :location

    def initialize
        @clicked = false
        @fringe = false
        @value = "_"
        @num_of_surrounding_bombs = 0
        @neighbors = []
        @location = nil,nil
    end

    def inspect
        @fringe.inspect
    end

   
end
