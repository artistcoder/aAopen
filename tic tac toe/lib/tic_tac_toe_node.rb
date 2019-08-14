require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = @board.select{|position| position.empty?}
    possible_moves.each do |possible_move|
      duped_board = @board.deep_dup
      duped_board[possible_move] = @next_mover_mark
     
    end

  end
end

class Array
  def deep_dup
      new_arr= []
      self.each do |element|
          if element.is_a? Integer
              new_arr << element 
          else
              new_arr << element.deep_dup
          end
      end
      new_arr
  end
end