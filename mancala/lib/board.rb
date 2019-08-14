class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[:stone,:stone,:stone,:stone]}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise ArgumentError.new("Invalid starting cup") if @cups[start_pos].nil?
    raise RuntimeError.new("Starting cup is empty") if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cups[idx] << stones.pop if current_player_name == @name1
      elsif idx == 13
        @cups[idx] << stones.pop if current_player_name == @name2
      else
        @cups[idx] << stones.pop
      end
    end
    render
    next_turn(idx)

    end

 

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx if @cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all?{|idx| @cups[idx].empty?} ||(7..12).all?{|idx| @cups[idx].empty?}
  end

  def winner
    player_1_stones = @cups[6].length
    player_2_stones = @cups[13].length
    if player_1_stones == player_2_stones
      :draw
    else
      player_1_stones > player_2_stones ? @name1 : @name2
    end

  end
end
