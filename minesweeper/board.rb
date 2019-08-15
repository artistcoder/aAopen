require_relative 'tile'

class Board
    attr_reader :grid
    NEIGHBOR_COORDINATE_DELTAS = 
    [[-1,-1],[-1,1],[-1,0],[0,1],[0,-1],[1,1],[1,0],[1,-1]]

    def initialize
        @grid = Array.new(9){Array.new(9){Tile.new}}
        add_bombs
        count_surrounding_bombs
    end

    def add_bombs
        coords = []
        i = 0
        while i < 11
            x = rand(0..8)
            y = rand(0..8)
            if !coords.include?([x,y])
                @grid[x][y].value = "B"
                coords << [x,y]
                i += 1
            end
        end
    end

    def count_surrounding_bombs
        @grid.each_with_index do |row,x|
            row.each_with_index do |tile,y|
                NEIGHBOR_COORDINATE_DELTAS.each do |delta|
                    dx, dy = delta
                    if (x+dx > -1 && x+dx < 9) && (y+dy > -1 && y+dy < 9)
                        if @grid[x+dx][y+dy].value == "B"
                            tile.num_of_surrounding_bombs += 1
                        end
                    end
                end
            end
        end
    end
    
    def render
        @grid.each do |row|
            row.each do |tile|
                print tile.value
            end
            puts
        end
    end
    def render2
        @grid.each do |row|
            row.each do |tile|
                print tile.num_of_surrounding_bombs
            end
            puts
        end
    end



end

bob = Board.new
bob.render
bob.render2


