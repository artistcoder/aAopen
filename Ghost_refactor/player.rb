class Player
    
    attr_accessor :name

    def initialize(name)
        @name = name
        @alphabet = "abcdefghijklmnopqrstuvwxyz"
    end

    def guess
        puts "#{self.name} enter a letter: "
        letter = gets.chomp
        if letter.length > 1 || !@alphabet.include?(letter.downcase)
            puts "must enter a single letter"
            self.guess
        else
            letter.downcase
        end
    end

end
