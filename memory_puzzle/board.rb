require_relative "card"

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
        @num_of_cards.times do |i|
            if i.even?
                new_card = Card.new
                card_array << new_card
            else
                card_array << new_card
            end
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
            print idx.to_s + " "
            sub_arr.each do |card|
                print card.face_value + " "
            end
            puts
        end
    end

    def print_rows
        print "  "
        @num_rows_and_cols.times do |i|
            print i.to_s + " "
        end
        puts
    end

    def render_board
        selected_cards
        populate_board
    end


end

test_board = Board.new(4)
test_board.render_board
p test_board.display_board

