class Board
    require_relative 'piece'

    def initialize
        @board = Array.new(8){Array.new(8)}
        @board.each_with_index do |row,idx|
            row.each_with_index do |element, idx2|
                if idx < 2 || idx > 5
                    @board[idx][idx2] = Piece.new
                else
                    @board[idx][idx2] = nil
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
        elsif !self.valid_pos?(end_pos)
            raise "Error: The new location is not valid"
        else
            piece.pos << end_pos
            self[start_pos] = nil
            self[end_pos] = piece
       end
    end

    def valid_pos?(pos)
    end


end

board = Board.new
p board[3][3]