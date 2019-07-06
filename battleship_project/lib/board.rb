class Board
  
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n*n
    end
    # n = 2
    #GRID [[N N],
    #     [N N]]
    #

    def [](idx_arr)
        row = idx_arr[0]
        col = idx_arr[1]
        @grid[row][col]
    end

    def []=(position, value)
        row = position[0]
        col = position[1]
        @grid[row][col] = value
    end

    def num_ships
        count = 0
        @grid.each do |arr|
            arr.each do |value|
                count += 1 if value == :S
            end
        end
        count
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            p "you sunk my battleship!"
            true
        else
            self[position] = :X
            false
        end
    end

    def place_random_ships
        ship_num = .25 * @size
        
    end





end
