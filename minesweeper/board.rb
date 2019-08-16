require_relative 'tile'
require 'colorize'

class Board
    attr_reader :grid
    NEIGHBOR_COORDINATE_DELTAS = 
    [[-1,-1],[-1,1],[-1,0],[0,1],[0,-1],[1,1],[1,0],[1,-1]]

    def initialize
        @grid = Array.new(9){Array.new(9){Tile.new}}
        set_tile_location
        add_bombs
        count_surrounding_bombs
        fringe_tiles
    end

    def set_tile_location
        @grid.each_with_index do |row,x|
            row.each_with_index do |tile,y|
                tile.location = x,y
            end
        end
    end

    def add_bombs
        coords = []
        i = 0
        while i < 10
            x = rand(0..8)
            y = rand(0..8)
            if !coords.include?([x,y])
                @grid[x][y].value = "💣"
                coords << [x,y]
                i += 1
            end
        end
    end

    def count_surrounding_bombs
        @grid.each do |row|
            row.each do |tile|
                neighbor_tiles(tile).each do |n_tile|
                    tile.num_of_surrounding_bombs += 1 if n_tile.value == "💣"
                end
            end
        end
    end

    def fringe_tiles
        @grid.each_with_index do |row,x|
            row.each_with_index do |tile,y|
                tile.fringe = true if tile.value != "💣" && tile.num_of_surrounding_bombs > 0
            end
        end
    end

    def update_board(user_guess)
        x,y = user_guess.split(/[\s,]/).map(&:to_i)
        start_tile = @grid[x-1][y-1]
        queue = [start_tile]
        visited = [start_tile]
        until queue.empty?
            current_tile = queue.shift
            current_tile.clicked = true
            return if current_tile.value == "💣"
            if neighbor_tiles(current_tile).all? {|tile| tile.value != "💣"}
                neighbor_tiles(current_tile).each do |tile|
                    if !visited.include?(tile)
                        queue << tile
                        visited << tile
                    end
                end
            end
        end
    end

    def neighbor_tiles(current_tile)
        neighbors = []
        x, y = current_tile.location
        NEIGHBOR_COORDINATE_DELTAS.each do |delta|
            dx, dy = delta
            if (x+dx > -1 && x+dx < 9) && (y+dy > -1 && y+dy < 9)
                neighbors << @grid[x+dx][y+dy]
            end
        end
        neighbors
    end

    def render
        print "  1 2 3 4 5 6 7 8 9".colorize(:blue)
        puts
        @grid.each_with_index do |row, i|
            print (i+1).to_s.colorize(:blue)
            print " "
            row.each do |tile|
                print tile.num_of_surrounding_bombs.to_s if (tile.clicked && tile.fringe)
                print tile.value if (tile.clicked && !tile.fringe && tile.value != "💣")
                print "💣" if (tile.clicked && tile.value == "💣")
                print "*" if !tile.clicked
                print " "
            end
            puts
        end
    end

    def reveal_bombs
        @grid.each do |row|
            row.each do |tile|
                tile.clicked = true if tile.value == "💣"
            end
        end
    end

    def game_over?
        @grid.any? do |row|
            row.any? do |tile|
                tile.value == "💣" && tile.clicked
            end
        end
    end

    def won?
        @grid.all? do |row|
            row.all? do |tile|
                tile.clicked && tile.value == "_" || !tile.clicked && tile.value == "💣"
            end
        end
    end


end
