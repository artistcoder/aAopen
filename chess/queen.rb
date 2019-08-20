
require_relative 'piece'
require_relative 'slideable'
require 'colorize'

class Queen < Piece
    include Slideable

    def symbol
        "♕".colorize(@color)
    end

    protected

    def move_dirs
        horizontal_vertical_dirs + diagonal_dirs
    end
end

queen = Queen.new(:white, Board.new, [1,1])
p queen.moves