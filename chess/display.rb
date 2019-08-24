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

until game.board.checkmate?(color_1) || game.board.checkmate?(color_2)
    # print "please select piece to move"
    # system("clear")
    # game.render
    
    begin
        game.render
        game.cursor.get_input
        system("clear")
        if end_pos.empty? && start_pos.empty? && !game.cursor.selected 
            puts "select piece to move"
        end
        if game.cursor.selected && start_pos.empty?
            start_pos = game.cursor.cursor_pos
            puts " select location where piece should be moved"
        end

        if !game.cursor.selected && end_pos.empty? && !start_pos.empty?
            end_pos = game.cursor.cursor_pos
        end

        if !end_pos.empty? && !start_pos.empty? 
            game.board.move_piece(start_pos,end_pos)
            start_pos, end_pos = [],[]
        end
        game.render
        system("clear") 
    rescue RuntimeError => e
        puts e
        start_pos, end_pos = [],[]
        retry
    end


end
game.render
if game.board.checkmate?(color_1)
    puts "Checkmate! Color #{color_2} wins the game"
else       
    puts "Checkmate! Color #{color_1} wins the game"
end
