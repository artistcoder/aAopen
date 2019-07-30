class Game
    require_relative "Player"

    def initialize
        @players = [Player.new, Player.new]
        @fragment = ""
        @dictionary = {}
        array = IO.readlines("dictionary.txt") 
        array.each do |word|
            @dictionary[word.chomp] = nil
          end
        end

    end

File.open()

end
