require_relative "board"

class Game

    def initialize
        @game = Board.new(4)
        @prev_guess = nil
    end

    def play
        @game.render_board

    end

    def over
    end

    def render_board
        selected_cards
        populate_board
    end

end
