require_relative "board"

class Game

    def initialize
        @game = Board.new(4)
        @prev_guess = nil
        @guessed_pos = nil
    end

    def play
        @game.populate_board
        until game_over?
            print "please enter a location: "
            @guessed_pos = gets.chomp
            @game.reveal(@guessed_pos)
            make_guess(@guessed_pos)
            system("clear")
            @game.display_board
        end
        print " You Won!"
    end

    def game_over?
        @game.won?
    end

    def make_guess(guessed_pos)
        if @prev_guess == nil
            #if there is no previous guess
            @prev_guess = guessed_pos
        else
            #if a previous card was selected
            if @game[@prev_guess] == @game[guessed_pos]
                puts "Match!"
                @game.reveal(guessed_pos)
            else
                print "Try again"
                system("clear")
                @game.reveal(guessed_pos)
                @game.display_board
                sleep(2)
                @game[@prev_guess].hide
                @game[guessed_pos].hide
            end
            @prev_guess = nil
        end

    end

    # if __FILE__ == $PROGRAM_NAME
    #     #test methods in here?
        
    # end

end

one_game = Game.new
one_game.play