class Board
  
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n*n
    end
    # n = 2
    # n = 9 ...81
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
        ship_num = @size/4
        ship_count = 0 
        arr_length = Math.sqrt(@size).round - 1
        while ship_count < ship_num
            rand_position = [rand(0..arr_length),rand(0..arr_length)]
            if self[rand_position] != :S
                self[rand_position] = :S
                ship_count += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = []
        @grid.each do |arr|
            hidden_arr = []
            arr.each do |symbol|
               if symbol == :S
                hidden_arr << :N
               else
                hidden_arr << symbol
               end
            end
            hidden_grid << hidden_arr
        end
        hidden_grid 
    end

    def self.print_grid(grid)
        grid.each do |row|
            row.each_with_index do |ele,idx|
                print ele.to_s
                if idx < row.length-1
                    print " "
                end
            end
            puts
        end
    end








end
