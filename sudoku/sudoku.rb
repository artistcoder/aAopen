require_relative "board"

sudoku = Board.new("sudoku1.txt")
sudoku.add_tiles_to_board
sudoku.render

#until solved get user input
    puts "Please enter a position:"
    position = gets.chomp
    puts "Please enter a guess for the position:"
    guess = gets.chomp

    sudoku[position] = guess
    sudoku.render
    




