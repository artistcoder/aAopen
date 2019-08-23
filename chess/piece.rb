
class Piece
    attr_reader :color
    attr_accessor :board, :pos

    def initialize(color = nil, board=nil, pos=nil)
        @color, @board, @pos = color, board, pos
    end

    def symbol
        " "
    end

    def valid_moves
        possible_moves = self.moves
        possible_moves.select{|end_pos| !move_into_check?(end_pos)}
    end

    def inspect
        @value = self
    end

    private
    def move_into_check?(end_pos)
        dup_board = @board.dup
        dup_board.move_piece(@pos, end_pos)
        if dup_board.in_check?(@color)
            return true
        end
        return false
    end


end

