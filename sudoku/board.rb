require_relative "tile"
require 'colorize'

class Board
    
    attr_reader :grid, :board
    
    def initialize(grid_file)
        @grid = IO.readlines(grid_file, chomp: true)
        @board = Array.new(9){Array.new(9)}

    end

    def add_tiles_to_board
        9.times do |idx_1|
            9.times do |idx_2|
                @board[idx_1][idx_2] = create_tile(idx_1, idx_2)
            end
        end
    end

    def create_tile(idx_1,idx_2)
        #called by add_tiles_to_board
        #creates new tiles. assigns tiles a number value via grid. 
        #makes given = true if value of tile is != 0
        tile = Tile.new
        tile.value = @grid[idx_1][idx_2]
        tile.given = true if tile.value != "0"
        tile
    end

    def []= (position,value)
        r,c = position.split(",").map(&:to_i)
        @board[r][c].value = value
    end

    def render
        puts "-------------------".colorize(:black)
        @board.each do |sub_arr|
            print "|"
            sub_arr.each do |tile|
                if tile.value != "0" && tile.given
                    print tile.value.colorize(:blue) + "|"
                elsif tile.value != "0" && !tile.given
                    print tile.value + "|"
                else
                    print " |"
                end
            end
            puts
            puts "-------------------"
        end
    end

end
