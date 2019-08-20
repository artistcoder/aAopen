
class Piece
    attr_reader :color, :pos
    attr_accessor :board

    def initialize(color = nil, board=nil, pos=nil)
        @color, @board, @pos = color, board, pos
    end

    def symbol
        " "
    end

end

