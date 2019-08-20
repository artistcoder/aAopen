require_relative 'piece'
require_relative 'board'

require_relative 'stepable'
require 'colorize'

class King < Piece
    include Stepable
    def symbol
        "♔".colorize(color)
    end
    protected
    def move_dirs
        [[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1]]
    end

end

king = King.new(:white, Board.new, [1,1])
p king.moves