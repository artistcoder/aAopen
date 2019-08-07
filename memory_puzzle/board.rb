require_relative "card"
require "colorize"

class Board
    attr_reader :board

    def initialize(n)
        @num_rows_and_cols = n
        @num_of_cards = n * n
        @board = Array.new(n){Array.new(n){""}}
    end

    def selected_cards
        card_array = []
        new_card = nil
        card_value_to_dupe = nil
        @num_of_cards.times do |i|
            new_card = Card.new
            if i.even?
                card_value_to_dupe = new_card.face_value
            else
                new_card.face_value = card_value_to_dupe
            end
            card_array << new_card
        end
        card_array.shuffle
    end

    def populate_board
        i = 0
        cards = selected_cards
        @num_rows_and_cols.times do |row|
            @num_rows_and_cols.times do |col|
                @board[row][col] = cards[i]
                i += 1
            end
        end
        @board
    end

    def display_board
        print_rows
        @board.each_with_index do |sub_arr,idx|
            print idx.to_s.colorize(:blue) + " "
            sub_arr.each do |card|
                print card.face_value if card.face_up
                print " " if card.face_down
                print " "
            end
            puts
        end
    end

    def print_rows
        print "  "
        @num_rows_and_cols.times do |i|
            print i.to_s.colorize(:blue) + " "
        end
        puts
    end

   def reveal(guessed_pos)
    r,c = guessed_pos.split(",").map(&:to_i)
    chosen_card = @board[r][c]
    chosen_card.reveal if chosen_card.face_down
    chosen_card.face_value
   end

   def [](pos)
    r,c = pos.split(",").map(&:to_i)
    @board[r][c]
   end
   
   def []=(pos, value)
    r,c = pos.split(",").map(&:to_i)
    @board[r][c] = value
   end

   def won?
    cards = @board.flatten
    cards.all?(&:face_up)
   end

end

# test_board = Board.new(4)
# test_board.render_board
# p test_board.display_board

