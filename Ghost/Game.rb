#require 'byebug'
class Game
    require_relative "player"
    
    attr_accessor :fragment
    attr_reader :current_player, :previous_player, :dictionary 

    def initialize(n)
        # sets a current player (defaults to player 1), and previous player (defaults to player 2)
        # initializes a word fragment to an empty string
        # create a dictionary hash, where all keys are dictionary entries and their asssociated value is nil
        # initialized a losses hash, all player keys are set with a loss key of 0
        # creates a GHOST string to translate the number of losses to the correct fragment of GHOSTß
        # 
        @players = Hash.new(0)
        n.times do |i|
            puts "please enter a name for player #{i+1}"
            player_name = gets.chomp
            @players[Player.new(player_name)] = 0
        end
        
        #puts "thihs is player 1s name: #{@players.keys[1].name}"
        #puts "thihs is player 2s name: #{@players.keys[1].name}"
        @current_player = @players.keys[0]
        @previous_player = @players.keys[1]

        @fragment = ""
        @dictionary = {}
        array = IO.readlines("dictionary.txt") 
        array.each do |word|
            @dictionary[word.chomp] = nil
        end
        #@players = {player_1 => 0 , player_2 => 0}
        @GHOST = "GHOST"
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
        # method variable to temporarily store the current player
        # assigns the previous player to the current player
        # assigns the temp current player to the previous player
        # tl;dr swaps current and previous players
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

