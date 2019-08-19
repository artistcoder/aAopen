class Board

    def initialize
        @board = Arrary.new(8){Array.new(8)}
        @board.each_with_index do |row,idx|
            row.each do |element|
                if idx < 2 || idx > 6
                    element = Piece.new
                else
                    element = nil
                end
            end
        end
    end

    def move_piece(start_pos, end_pos)
    end


end

