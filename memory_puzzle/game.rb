require_relative "board"

class Game

    def initialize
        @game = Board.new(4)
        @prev_guess = nil
        @guessed_pos = nil
    end

    def play
        @game.populate_board
        #until game_over?
            print "please enter a location: "
            @guessed_pos = gets.chomp
            puts @guessed_pos
            @game.reveal(@guessed_pos)
            @game.display_board
            puts @game[@guessed_pos].face_value
            #makes_guess(guessed_pos)
        #end
    end

    def game_over?
        #check if all cards are revealed
    end

    def make_guess(guessed_pos)
        if @prev_guess == nil
            #if there is no previous guess
            @board
            @prev_guess = guessed_pos
        else
            #if another card was selected
            @prev_guess = nil
        end

    end

    # if __FILE__ == $PROGRAM_NAME
    #     #test methods in here?
        
    # end

end

one_game = Game.new
one_game.play