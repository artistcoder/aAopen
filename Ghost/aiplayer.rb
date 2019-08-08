class AiPlayer
    require_relative "game"
    def initialize(n, current_fragment)
        @num_of_other_players = n - 1
        @current_word_fragment = current_fragment
        @name = "computer"
    end

    def guess(current_word_fragment)
    end
end
