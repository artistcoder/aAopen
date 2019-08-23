require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([2,2], board)
    end

    def render
        cursor_pos = @cursor.cursor_pos
        puts "  a  b  c  d  e  f  g  h"
        @board.board.each_with_index do |row, r|
            print 8-r
            row.each_with_index do |piece, c|
                if r == cursor_pos[0] && c == cursor_pos[1]
                    if cursor.selected
                        print " ⊕ ".colorize(:red)
                    else
                        print " ⊕ ".colorize(:blue)
                    end
                elsif c % 2 ==0 && r % 2 == 0 || c % 2 !=0 && r % 2 != 0
                    print " ".colorize(:background => :gray) + piece.symbol.colorize(:background => :gray) + " ".colorize(:background => :gray)
                else
                    print " ".colorize(:background => :white) + piece.symbol.colorize(:background => :white) + " ".colorize(:background => :white)
                end
            end
            puts
        end
    end
end



game = Display.new(Board.new)
color_1 = :green
color_2 = :magenta
start_pos = []
end_pos = []
game.render
until game.board.checkmate?(color_1) || game.board.checkmate?(color_2)
    p "please select piece to move"
    game.cursor.get_input
   
    system("clear")
    game.render
    begin
        if game.cursor.selected && start_pos.empty?
            start_pos = game.cursor.cursor_pos
            p "please select location where piece should be moved"
        end
    rescue
        put "Error"
        retry
    end

    begin
        if !game.cursor.selected && end_pos.empty? && !start_pos.empty?
            end_pos = game.cursor.cursor_pos
        end
    rescue
        put "error"
        retry
    end

    if !end_pos.empty? && !start_pos.empty? 
        game.board.move_piece(start_pos,end_pos)
        start_pos, end_pos = [],[]
    end

end
