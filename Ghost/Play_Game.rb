require_relative "game"

ghost = Game.new(Player.new("player 1"), Player.new("player 2"))

ghost.run
# until ghost.lose? do
#     puts "-------------------------"
#     ghost.play_round
# end