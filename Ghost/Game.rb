#require 'byebug'
class Game
    require_relative "player"
    
    attr_accessor :fragment
    attr_reader :current_player, :previous_player, :dictionary 

    def initialize(n)
        @players = Hash.new(0)
        @num_players = n
        # @current_player = @players.keys[0]
        # @previous_player = @players.keys[1]
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
        # prints the current word fragment
        # calls on Game#take turn method for current player
        # returns the new word fragment created by the current player
        # checks if the word fragments is valid via the valid_play? method
        # if valid, checks if the player has lost (created a valid word) via the lose? method
        # if valid and did not lose, then current player is updated to next player
        # if not a valid fragment, then error message prints and method is called again on the same player
       
        new_fragment = self.take_turn(@current_player)
        
        if valid_play?(new_fragment)
            @fragment = new_fragment
            if self.lose?
                @fragment = ""
                self.next_player
                puts " N E W   R O U N D"
                puts "--------------------------------------------------------------"
                puts "<<< current word fragment is: #{@fragment}         >>>"
               
            else
                puts "--------------------------------------------------------------"
                puts "<<< current word fragment is: #{@fragment}         >>>"
                self.next_player
            end
        else
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            puts "#{new_fragment} is not the beginning of a word. Please enter a valid letter."
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            self.play_round
        end
    end

    def take_turn(player)
        # calls Player#guess for user to enter a letter
        # returns the existing fragment + new letter
        letter = player.guess
        @fragment + letter
    end

    def valid_play?(new_frag)
        # creates new dictionary of word fragments where all words are the same length as the current word fragment
        # checks if current word fragment can be found in new dictionary
        # if word cannot be found, then false is returned -- word fragment is not valid
        # if word is found, then true is returned
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
        num_players = @players.keys.length
        current_player_loc = @players.keys.index(@current_player)
        @previous_player = @players.keys[current_player_loc]
            
        (1...num_players).each do |i|
            new_index = (current_player_loc + i) % num_players
            potential_curr_player = @players.keys[new_index]
            if @players[potential_curr_player] < 5
                @current_player = @players.keys[new_index]
                break
            end
        end
        
    end

    def out_of_game(player)
        #not currently in use. quick method to check is player is out of the game
        return true if @players[player] >= 5
        return false
    end


    def lose?
        # checks if existing word fragment is in the dictionary aka a real word. 
        # if so, player has lost,  and their Hash loss value is increased by 1
        # this is the end a round, so the new scoreboard is printed and true (the player did lose) is returned
        #if not, false (player did not lose) is returned
        if @dictionary.keys.include?(@fragment)
            @players[@current_player] += 1
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            if @players[@current_player] < 5
                puts "#{@current_player.name.upcase}! You lost this round. You made the word #{@fragment}"
                puts "-----------SCOREBOARD-----------"
                @players.keys.each do |player|
                    puts "     #{player.name.upcase} : #{@GHOST[0...@players[player]]}"
                end
            end
            if @players[@current_player] == 5
                
                puts "OHHHHHH NOOOOOO! #{@current_player.name.upcase}!"
                puts "You are out of the game. You made the word #{@fragment}, and completed the word GHOST"
                puts "-----------SCOREBOARD-----------"
                @players.keys.each do |player|
                    puts "     #{player.name.upcase} : #{@GHOST[0...@players[player]]}"
                end
            end
            return true
        else
            return false
        end
    end

    def run
        # rounds of the game are played until there is only one player with less than 5 losses
        populate_dictionary
        rules
        get_player_names
        self.play_round until @players.values.one?{|loss| loss < 5}
            puts "G  A  M  E     O  V  E  R"
            puts "-----FINAL SCOREBOARD---------"
            @players.keys.each do |player|
                puts "     #{player.name.upcase} : #{@GHOST[0...@players[player]]}"
        end
        puts        
        #puts "#{@current_player.name} wins!"
    end


end

