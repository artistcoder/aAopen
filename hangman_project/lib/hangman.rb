class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

def initialize
  @secret_word = Hangman.random_word
  @guess_word = Array.new(@secret_word.length, '_')
  @attempted_chars = []
  @remaining_incorrect_guesses = 5 
end

def guess_word
  return @guess_word
end

def attempted_chars
  return @attempted_chars
end

def remaining_incorrect_guesses
  return @remaining_incorrect_guesses 
end

 def already_attempted?(char)
  return true if @attempted_chars.include?(char)
  return false
 end

 def get_matching_indices(char)
    idx_arr = []
    @secret_word.each_char.with_index do |ele, idx|
      idx_arr << idx if ele == char
    end
    idx_arr
 end

def fill_indices(char, arr)
  # a 1,2,3
  arr.each{|idx| @guess_word[idx] = char}
end

def try_guess(char)
  idx_arr = get_matching_indices(char)
  @remaining_incorrect_guesses -= 1 if idx_arr.length == 0
  self.fill_indices(char, idx_arr)

  if self.already_attempted?(char)
    p "that has already been attempted"
    false
  else
    attempted_chars << char
    true
  end

end

def ask_user_for_guess
  p 'Enter a char:'
  return try_guess(gets.chomp)
end

def win?
  if @guess_word.join("") == @secret_word
    p "WIN"
    true
  else
    false
  end
end


def lose?
  if @remaining_incorrect_guesses == 0
    p "LOSE"
    true
  else
    false
  end
end

def game_over?
  if self.win? || self.lose?
    p @secret_word
    return true
  end
  if !self.lose?
    return false
  end
end

end