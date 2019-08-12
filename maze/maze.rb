class Maze

    attr_reader :maze_map, :s_loc, :e_loc, :current_loc, :path

    def initialize(maze_file)
        @maze_map = IO.readlines(maze_file, chomp: true)
        find_start_and_end_points
        @current_loc = @s_loc
        @path = []
        @dead_ends = []
    end

    def find_start_and_end_points
        @maze_map.each_with_index do |row, row_idx|
            row.each_char.with_index do |char, col_idx|
                @s_loc = row_idx, col_idx if char == "S" 
                @e_loc = row_idx, col_idx if char == "E" 
            end
        end
    end

    def make_path
        return display_path if up == @e_loc || down == @e_loc || left == @e_loc || right == @e_loc
        if move(up) || move(right) || move(down) || move(left)
        else
            @dead_ends << @path.pop
            @current_loc = @path[-1] 
        end
        make_path
    end

    def move(location)
        if self[location] == " " && not_a_dead_end(location) && !path.include?(location)
            @current_loc = location
            @path << @current_loc
            return true
        end
        return false
    end


    def display_path
        @path.each do |coordinate|
            self[coordinate] = "+"
        end
        puts @maze_map
    end


    def not_a_dead_end(direction)
        return false if @dead_ends.include?(direction)
        true
    end

    def [](pos)
        r,c = pos
        @maze_map[r][c]
    end

    def []=(pos,value)
        r,c = pos
        @maze_map[r][c] = value
    end

    def up
        [@current_loc[0]-1, @current_loc[1]]
    end
    def down
        [@current_loc[0]+1, @current_loc[1]]
    end
    def left
        [@current_loc[0], @current_loc[1]-1]
    end
    def right
        [@current_loc[0], @current_loc[1]+1]
    end

end


maze = Maze.new("example_1_maze.txt")
maze.make_path
#maze.display_path
