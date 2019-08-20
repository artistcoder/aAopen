class Board
    require_relative 'piece'

    def initialize
        @board = Array.new(8) do |r|
            Array.new(8) do |c|
                if r < 2
                    Piece.new(:white, self, [r,c])
                elsif r > 5
                    Piece.new(:black, self, [r,c])
                else
                    nil
                end
            end
        end
    end

    def [](pos)
        r,c = pos
        @board[r][c]
    end
    def []=(pos,value)
        r,c = pos
        @board[r][c] = value
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]
        if self[start_pos] == nil
            raise "Error: There is no piece at this location"
        elsif !self.valid_pos?(start_pos, end_pos)
            raise "Error: The new location is not valid"
        else
            piece.pos << end_pos
            self[start_pos] = nil
            self[end_pos] = piece
       end
    end

    def valid_pos?(start_pos, end_pos)
        return true if self[end_pos] == nil || self[start_pos].color != self[end_pos].color
        return false
    end


end

# board = Board.new

# #board[0,0] = Bishop.new(:white, board, [0,0])
# p board