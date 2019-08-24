class Board
    require_relative 'piece'
    require_relative 'rook'
    require_relative 'knight'
    require_relative 'bishop'
    require_relative 'queen'
    require_relative 'king'
    require_relative 'pawn'
    require_relative 'nullpiece'
    attr_reader :board

    def initialize
        @board = Array.new(8) do |r|
            Array.new(8) do |c|
                if r == 0
                    add_piece(:magenta,[r,c])
                elsif r == 1
                    Pawn.new(:magenta,self,[r,c])
                elsif r == 6
                    Pawn.new(:green,self,[r,c])
                elsif r == 7
                    add_piece(:green,[r,c])
                else
                    NullPiece.instance
                end
            end
        end

    end

    def add_piece(color,pos)
        r,c = pos
        if c == 0 || c == 7
            Rook.new(color, self, pos)
        elsif c == 1 || c == 6
            Knight.new(color, self, pos)
        elsif c == 2 || c == 5
            Bishop.new(color, self, pos)
        elsif c == 3
            Queen.new(color, self, pos)
        elsif c == 4
            King.new(color, self, pos)
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
        if !valid_pos?(end_pos)
            raise "Error: destination needs to be within boundary of the Chess Board"
        end
        piece = self[start_pos]
        if piece.is_a? NullPiece
            raise "Error: There is no piece at this location"
        elsif !self.valid_move?(start_pos, end_pos)
            raise "Error: The new location is not valid"
        elsif !piece.moves.include?(end_pos)
            raise "Error: Not a possible move for the given piece"
        else
            piece.pos = end_pos
            self[start_pos] = NullPiece.instance
            self[end_pos] = piece
       end
    end

    def valid_move?(start_pos, end_pos)
        return true if self[end_pos].is_a? NullPiece
        return true if self[start_pos].color != self[end_pos].color
        return false
    end

    def valid_pos?(end_pos)
        x,y = end_pos
        return true if x <=7 && x>=0 && y <=7 && y>=0
        return false
    end

    def in_check?(color)
        king_loc = find_king(color)
        possible_opponent_moves = []
        @board.each do |row|
            row.each do |piece|
                if piece.color != color && piece.color != nil
                    possible_opponent_moves += piece.moves
                end
            end
        end
        possible_opponent_moves.include?(king_loc)
    end

    def find_king(color)
        loc = []
        @board.each_with_index do |row, r|
            row.each_with_index do |piece,c|
                loc = [r,c] if piece.class == King && piece.color == color
             end
        end
        loc
    end

    def dup
        dup_board = Board.new
        @board.each_with_index do |row, r|
            row.each_with_index do |piece, c|
                color = piece.color
                position = r,c
                piece_type = piece.class
                if piece_type == NullPiece
                    dup_board[position] = piece_type.instance
                else
                    dup_board[position] = piece_type.new(color,dup_board,position)
                end
            end
 
        end
        dup_board
    end


    def checkmate?(color)
        color_pieces = []
        @board.each do |row|
            row.each {|piece| color_pieces << piece if piece.color == color}
        end
        color_pieces
        if color_pieces.all?{|piece| piece.valid_moves.empty?} && in_check?(color)
            return true
        end
        return false
    end
   


end