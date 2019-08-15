
require_relative "board"

minesweeper = Board.new

until minesweeper.game_over? || minesweeper.won?
    system "clear"
    # minesweeper.render2
    minesweeper.render
    puts "Enter location to reveal: "
    user_guess = gets.chomp
    minesweeper.update_board(user_guess)
end

system "clear"
minesweeper.reveal_bombs
minesweeper.render
if minesweeper.game_over? 
    puts "Game Over - you hit a bomb"
else
    puts "You Won!"
end
