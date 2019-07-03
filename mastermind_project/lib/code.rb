class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all?{|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def self.random(len)
    peg_arr = []
    len.times{peg_arr << POSSIBLE_PEGS.keys.sample}
    Code.new(peg_arr)
  end

  def self.from_string(peg_string)
    Code.new(peg_string.split(""))
  end

  def initialize(char_arr)
    raise ArgumentError.new('Error: pegs are not valid') if !Code.valid_pegs?(char_arr)  
    @pegs = char_arr.map(&:upcase)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_code)
    # return the number of pegs in the guess that are the correct color and position as @pegs
    count = 0
    (0...guess_code.length).each do |idx|
      count += 1 if self[idx] == guess_code[idx]
    end
    count
  end

  def num_near_matches(code)
    matches = 0
    code_hash = Hash[POSSIBLE_PEGS.keys.product([0])]
    pegs_hash = Hash[POSSIBLE_PEGS.keys.product([0])]
    code.pegs.each do |peg|
      code_hash[peg] += 1
    end
    @pegs.each do |peg2|
      pegs_hash[peg2] += 1
    end
    code_hash.each do |k,v|
      if code_hash[k] < pegs_hash[k]
        matches += code_hash[k]
      else
        matches += pegs_hash[k]
      end
    end
    matches - num_exact_matches(code)
  end

  def ==(code)
    self.pegs == code.pegs
  end


  # ABCB  code a 1 b1 c 1
  # BBCA pegs b2 c1
  # 2 EXACT. 1 NEAR

end
