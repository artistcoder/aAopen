require_relative 'piece'
require_relative 'board'

require_relative 'slideable'
require 'colorize'

class Bishop < Piece
    include Slideable

    def symbol
        "♗".colorize(color)
    end

    protected

    def move_dirs
        diagonal_dirs
    end
end

bishop = Bishop.new(:white, Board.new, [1,1])
p bishop.moves