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
        puts "-------------------"
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

    def solved?
        rows_solved? && cols_solved && grids_solved
    end

    def rows_solved?
        (0..8).all? do |row|
            col_values = []
            (0..8).each do |col|
                col_values << @board[row][col].value.to_i
            end
            (1..9).all? do |num|
                col_values.include?(num)
            end
        end
    end      
    #     @board.all? do |sub_arr|
    #         row_values = []
    #         sub_arr.each do |tile|
    #             row_values << tile.value.to_i
    #         end
    #         (1..9).all? do |num|
    #             row_values.include?(num)
    #         end
    #     end
    # end

    def cols_solved?
       (0..8).all? do |col|
            col_values = []
            (0..8).each do |row|
                col_values << @board[row][col].value.to_i
            end
            (1..9).all? do |num|
                col_values.include?(num)
            end
        end
    end
    
    def grids_solved?
    end


end

sudoku = Board.new("sudoku1_almost.txt")
sudoku.add_tiles_to_board
sudoku.render
sudoku.cols_solved?