#require 'byebug'
class Game
    NUM_OF_LOSSES = 5
    require_relative "player"
    require_relative "aiplayer"
    
    attr_accessor :fragment
    attr_reader :current_player, :previous_player, :dictionary 

    def initialize(n)
        @players = Hash.new(0)
        @num_players = n
        @fragment = ""
        @dictionary = {}
        @GHOST = "GHOST"
    end

    def rules
        puts
        puts "R U L E S   O F   T H E   G A M E"
        puts "----------------------------------"
        puts "(1) All players start with a loss record of 0"
        puts "(2) An empty word fragment is initialized at the start of each round"
        puts "(3) Players take turns selecting letters. As they are selected, the letters are combined into a growing word fragment"
        puts "(4) Players must choose a letter than can truly form a word (by adding additional letters)"
        puts "(5) Player loses the round if they choose a letter that completes a word"
        puts "(6) Player that loses the round is given a letter of the word GHOST"
        puts "(7) Once the player has lost 5 times (and completed the word GHOST on the scoreboard) then they are out of the game"
        puts "!!!The last player, who has not lost 5 times, wins!!!"
        puts "----------------------------------"
        puts "let's play!"
    end

    def populate_dictionary
        array = IO.readlines("dictionary.txt") 
        array.each do |word|
            @dictionary[word.chomp] = nil
        end
    end

    def get_player_names
        @num_players.times do |i|
            puts "please enter a name for player #{i+1} : "
            player_name = gets.chomp
            @players[Player.new(player_name)] = 0
        end
        set_initial_players
    end

    def set_initial_players
        @current_player = @players.keys[0]
        @previous_player = @players.keys[1]
    end

    def play_round
        new_fragment = self.take_turn(@current_player)
        if valid_play?(new_fragment)
            @fragment = new_fragment
            new_round_display if self.lose? && !self.game_over
            word_fragment_display if !self.game_over
            self.next_player
        else
            fragment_not_a_word_error(new_fragment)
            self.play_round
        end
    end

    def new_round_display
        puts
        puts " N E W   R O U N D"
    end

    def word_fragment_display
        puts "--------------------------------------------------------------"
        puts "<<< current word fragment is: #{@fragment}         >>>"
    end

    def fragment_not_a_word_error(new_fragment)
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts "#{new_fragment} is not the beginning of a word. Please enter a valid letter."
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    end


    def take_turn(player)
        # calls Player#guess for user to enter a letter
        # returns the existing fragment + new letter
        letter = player.guess if player.instance_of? Player
        letter = player.guess(@fragment) if player.instance_of? AiPlayer
        @fragment + letter
    end

    def valid_play?(new_frag)
        length = new_frag.length
        snipped_dictionary = @dictionary.keys.map do |word|
            word[0...length]
        end
        return true if snipped_dictionary.include?(new_frag)
        return false
    end

    def next_player
        # makes the previous player  = the current player
        # goes through the player hash, starting with the player immediately after the current player
        #if the next player is not out of the game (has 5 losses), then the next player is made current player
        # if not, check the next next player (etc)
        # % used for instances where the next players are at the beginning of the hash, and the current player is at
        #end of the hash
        current_player_loc = @players.keys.index(@current_player)
        @previous_player = @players.keys[current_player_loc]
            
        (1...@num_players).each do |i|
            new_index = (current_player_loc + i) % @num_players
            potential_curr_player = @players.keys[new_index]
            if @players[potential_curr_player] < NUM_OF_LOSSES
                @current_player = potential_curr_player
                break
            end
        end
        
    end


    def lose?
        if @dictionary.keys.include?(@fragment)
            @players[@current_player] += 1
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            lose_round?
            lost_the_game?
            @fragment = ""
            return true
        else
            return false
        end
    end

    def lose_round?
        if @players[@current_player] < NUM_OF_LOSSES 
            puts "#{@current_player.name.upcase}! You lost this round. You made the word #{@fragment}"
            scoreboard_display
        end
    end

    def lost_the_game?
        if @players[@current_player] == NUM_OF_LOSSES  
            puts "OHHHHHH NOOOOOO! #{@current_player.name.upcase}!"
            puts "You are out of the game. You made the word #{@fragment}, and completed the word GHOST"
            scoreboard_display
        end
    end

    def scoreboard_display
        puts "-----------SCOREBOARD-----------"
        @players.keys.each do |player|
            puts "     #{player.name.upcase} : #{@GHOST[0...@players[player]]}"
        end
    end


    def game_over
        @players.values.one?{|loss| loss < NUM_OF_LOSSES}
    end


    def run
        # rounds of the game are played until there is only one player with less than 5 losses
        populate_dictionary
        rules
        get_player_names
        self.play_round until game_over
        puts
        puts "G  A  M  E     O  V  E  R"
        puts
        puts "-----------F I N A L-----------"
        scoreboard_display
        puts        
        #puts "#{@current_player.name} wins!"
    end


end

