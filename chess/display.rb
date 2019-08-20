require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board.board
        @cursor = Cursor.new([2,2], board)
    end

    def render
        cursor_pos = @cursor.cursor_pos
        @board.each_with_index do |row, r|
            row.each_with_index do |piece, c|
                if r == cursor_pos[0] && c == cursor_pos[1]
                    print "⊕ ".colorize(:blue)
                elsif c % 2 ==0 && r % 2 == 0 || c % 2 !=0 && r % 2 != 0
                    print piece.symbol.colorize(:background => :gray) + " ".colorize(:background => :gray)
                else
                    print piece.symbol.colorize(:background => :white) + " ".colorize(:background => :white)
                end
            end
            puts
        end
    end
end

game = Display.new(Board.new)

    game.render
    game.cursor.get_input

