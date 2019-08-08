class Player
    ALPHABET = "abcdefghijklmnopqrstuvwxyz"
    attr_accessor :name
    
    def initialize(name)
        @name = name
    end

    def guess
        puts "#{self.name} enter a letter: "
        letter = gets.chomp
        validate_guess(letter)
    end

    def validate_guess(letter)
        if letter.length > 1 || !ALPHABET.include?(letter.downcase)
            invalid_entry_error
            self.guess
        else
            return letter.downcase
        end
    end

    def invalid_entry_error
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        puts "must enter a single letter"
        puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    end
    
end
