require_relative "game"

ghost = Game.new(3)

ghost.run
# until ghost.lose? do
#     puts "-------------------------"
#     ghost.play_round
# end