require_relative 'piece'
require_relative 'board'

require_relative 'stepable'
require 'colorize'

class Knight < Piece
    include Stepable

    def symbol
        "♘".colorize(color)
    end

    protected
    def move_dirs
        [[-1,2],[-1,-2],[1,-2],[1,2],[-2,1],[-2,-1],[2,-1],[2,1]]
    end

end

knight = Knight.new(:white, Board.new, [1,1])
p knight.moves