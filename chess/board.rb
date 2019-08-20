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
                    add_piece(:white,[r,c])
                elsif r == 1
                    Pawn.new(:white,self,[r,c])
                elsif r == 6
                    Pawn.new(:black,self,[r,c])
                elsif r == 7
                    add_piece(:black,[r,c])
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

    def render
        @board.each do |row|
            row.each do |piece|
                print piece.symbol
            end
            puts
        end
    end


end

board = Board.new

# #board[0,0] = Bishop.new(:white, board, [0,0])
board.render