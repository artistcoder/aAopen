
require_relative "board"

minesweeper = Board.new

until minesweeper.game_over?
    # minesweeper.render2
    system "clear"
    minesweeper.render
    puts "Enter location to reveal: "
    user_guess = gets.chomp
    minesweeper.update_board(user_guess)
end

puts "Game Over - you hit a bomb"