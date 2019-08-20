class Board
    require_relative 'piece'
    require_relative 'rook'
    require_relative 'knight'
    require_relative 'bishop'
    require_relative 'queen'
    require_relative 'king'
    require_relative 'pawn'
    require_relative 'nullpiece'
    require 'colorize'


    def initialize
        # @board = Array.new(8) do |r|
        #     Array.new(8) do |c|
        #         if r < 2
        #             Piece.new(:white, self, [r,c])
        #         elsif r > 5
        #             Piece.new(:black, self, [r,c])
        #         else
        #             nil
        #         end
        #     end
        # end
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
        if !in_bounds?(end_pos)
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

    def in_bounds?(end_pos)
        x,y = end_pos
        return true if x <=7 && x>=0 && y <=7 && y>=0
        return false
    end

    def render
        @board.each_with_index do |row, r|
            row.each_with_index do |piece, c|
                if c % 2 ==0 && r % 2 == 0 || c % 2 !=0 && r % 2 != 0
                    print piece.symbol.colorize(:background => :gray) + " ".colorize(:background => :gray)
                else
                    print piece.symbol.colorize(:background => :white) + " ".colorize(:background => :white)
                end
            end
            puts
        end
    end


end

board = Board.new
pos = 3,3
pos2 = 4,4
# p board[pos].is_a? NullPiece
# p board
# board.move_piece([1,3], [3,3])
# board.move_piece([6,4], [4,4])

# board.move_piece([3,3], [4,4])


# pos = 1,1
# p board[pos].is_a? NullPiece
# #board[0,0] = Bishop.new(:white, board, [0,0])
board.render