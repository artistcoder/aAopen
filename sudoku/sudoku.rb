require_relative "board"

sudoku = Board.new("sudoku1_almost.txt")
sudoku.add_tiles_to_board
sudoku.render

until sudoku.solved?
    puts "Please enter a position:"
    position = gets.chomp
    puts "Please enter a guess for the position:"
    guess = gets.chomp

    sudoku[position] = guess
    sudoku.render
end

puts "you won!"




