
class Piece
    attr_reader :color
    attr_accessor :board, :pos

    def initialize(color = nil, board=nil, pos=nil)
        @color, @board, @pos = color, board, pos
    end

    def symbol
        " "
    end

end

