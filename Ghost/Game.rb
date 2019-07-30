class Game
    require_relative "player"
    
    attr_accessor :fragment
    attr_reader :current_player, :previous_player, :dictionary 

    def initialize(player_1, player_2)
        @current_player = player_1
        @previous_player = player_2
        @fragment = ""
        @dictionary = {}
        array = IO.readlines("dictionary.txt") 
        array.each do |word|
            @dictionary[word.chomp] = nil
        end
        @losses = {player_1 => 0 , player_2 => 0}
        @GHOST = "GHOST"
    end

    def play_round
        puts "--------------------------------------------------------------"
        puts "<<< current word fragment is: #{@fragment}         >>>"
        new_fragment = self.take_turn(@current_player)
        
        if valid_play?(new_fragment)
            @fragment = new_fragment
            if self.lose?
                @fragment = ""
                self.next_player
                puts " N E W   R O U N D"
            else
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
        letter = player.guess
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
        temp_current = @current_player
        @current_player = @previous_player
        @previous_player = temp_current
    end

    def lose?
        if @dictionary.keys.include?(@fragment)
            @losses[@current_player] += 1
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            puts "oh no! #{@current_player.name}! You lost this round. You made the word #{@fragment}"
            puts "-----------SCOREBOARD-----------"
            puts "     #{@current_player.name} losses: #{@GHOST[0...@losses[@current_player]]}"
            puts "     #{@previous_player.name} losses: #{@GHOST[0...@losses[@previous_player]]}"
            puts "-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
            puts
            return true
        else
            return false
        end
    end

    def run
        self.play_round until @losses.values.any?{|loss| loss >= 5}
        puts "G  A  M  E     O  V  E  R"
        puts "-----FINAL SCOREBOARD---------"
        puts "#{@current_player.name} losses: #{@GHOST[0...@losses[@current_player]]}"
        puts "#{@previous_player.name} losses: #{@GHOST[0...@losses[@previous_player]]}"
        puts        
        puts "#{@current_player.name} wins!"
    end


end

