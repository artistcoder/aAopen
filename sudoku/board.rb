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
        puts "-------------------"
        @board.each do |sub_arr|
            print "|"
            sub_arr.each do |tile|
                if tile.value != "0" && tile.given
                    print tile.value.colorize(:magenta) + "|"
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

    def solved?
        rows_solved? && cols_solved? && grids_solved?
    end

    def rows_solved?
        (0..8).all? do |row|
            row_values = []
            (0..8).each do |col|
                row_values << @board[row][col].value.to_i
            end
            required_nums_included?(row_values)
        end
    end      

    def cols_solved?
       (0..8).all? do |col|
            col_values = []
            (0..8).each do |row|
                col_values << @board[row][col].value.to_i
            end
            required_nums_included?(col_values)
        end
    end

    def required_nums_included?(value_array)
        (1..9).all? do |num|
            value_array.include?(num)
        end
    end

    def grids_solved?
        (0..2).all? do |j|
            (0..2).all? do |i|
                grid_values = []
                    (0+(j*3)..2+(j*3)).each do |row|
                        (0+(i*3)..2+(i*3)).each do |col|
                            grid_values << @board[row][col].value.to_i
                        end
                     end
                required_nums_included?(grid_values)
            end
        end
    end

end
