require_relative "tile"

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
        tile = Tile.new
        tile.value = @grid[idx_1][idx_2]
        tile.given = true if tile.value = "0"
        tile
    end


end

test_board = Board.new("sudoku1.txt")
test_board.add_tiles_to_board
p test_board.board