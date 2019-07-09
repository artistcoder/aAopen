require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        p "number of ships: " + @board.num_ships.to_s
        p "total number of allowed misses: " + @remaining_misses.to_s
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            true
        else
            false
        end
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            true
        else
            false
        end
    end

    def game_over?
        # if we lost. or if we won, and didnt lose
        self.lose? || self.win? && !self.lose?
    end

    def turn
        orig_num_ships = @board.num_ships
        print "coordinate must be between 0 and " + (Math.sqrt(@board.size).round - 1).to_s + " -----> "
        @board.attack(@player.get_move)
        @board.print
        @remaining_misses -= 1 if orig_num_ships == @board.num_ships
        puts "remaining misses: " +  @remaining_misses.to_s
        puts "remaining ships: " + @board.num_ships.to_s
    end



end
