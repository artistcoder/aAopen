require_relative 'board'
class Display
    attr_reader :board

    def initialize(board)
        @board = board.board
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

game = Display.new(Board.new)
game.render