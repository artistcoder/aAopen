require 'set'

class WordChainer
    attr_reader :dictionary
    def initialize(dictionary_file_name)
        @dictionary = Set.new IO.readlines(dictionary_file_name, chomp: true)
    end

    def run(source, target)
        @current_words, @all_seen_words = [source], { source => nil }
        while @current_words.length > 0 || !@all_seen_words.include?(target)
            explore_current_words
        end
        build_path(target)
    end

    def adjacent_words(word)   
        # This should return all words in the dictionary one letter different than the current word.  
        # e.g. "mat" and "cat" count as adjacent words, but "cat" and "cats" do not, nor do "cola" and "cool."
        same_length_words = @dictionary.select{|dictionary_word| dictionary_word.length == word.length}
        same_length_words.select do |same_length_word|
            i = 0
            same_length_word.each_char.with_index do |char, idx|
                i += 1 if word[idx] != char
            end
            i == 1
        end
    end



    def explore_current_words
        new_current_words = []
        @current_words.each do |current_word|
            adjacent_words(current_word).each do |adjacent_word|
                if !@all_seen_words.include?(adjacent_word)
                    new_current_words << adjacent_word 
                    @all_seen_words[adjacent_word] = current_word
                end
            end
        end
        @current_words = new_current_words
        # new_current_words.each do |current_word|
        #     # print "current word is #{current_word} and it came from #{@all_seen_words[current_word]}"
        #     # print "________________________________________"
        #     #  puts
        # end

    end

    def build_path(target)
        path = [target]
        while @all_seen_words[target] != nil
            path.unshift(@all_seen_words[target])
            target = @all_seen_words[target]
        end
        puts path
    end


    


    
end

game = WordChainer.new("dictionary.txt")

game.run("goop","head")