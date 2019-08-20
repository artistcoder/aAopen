require_relative 'board'

class Piece
    attr_reader :color, :pos
    attr_accessor :board

    def initialize(color,board,pos)
        @color, @board, @pos = color, board, pos
    end

    def symbol
        " "
    end

end

