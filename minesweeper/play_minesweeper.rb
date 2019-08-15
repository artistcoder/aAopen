
require_relative "board"

minesweeper = Board.new

until minesweeper.game_over? || minesweeper.won?
    system "clear"
    # minesweeper.render2
    minesweeper.render
    puts "Enter location to reveal cell (avoid the bombs!): "
    user_guess = gets.chomp
    x,y = user_guess.split(/[\s,]/).map(&:to_i)
    if (x>9 || x<1) || (y>9 || y<1)
        puts "Must enter a valid location"
    else
        minesweeper.update_board(user_guess)
    end 
end

system "clear"
minesweeper.reveal_bombs
minesweeper.render
if minesweeper.game_over? 
    puts "Game Over - you hit a bomb at location #{x},#{y}"
else
    puts "You Won!"
end
