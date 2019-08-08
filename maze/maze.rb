class Maze
# takes in a maze text file, and finds a path between the
# S and E locations. Must respect the * walls

#find S starting point
# look at surrounding spaces (Up, Down, Left, Right)
# move to first availeble surrounding space.
# continue until stuck
# add "stuck spots to ''do not go array'''"
#< if stuck, go back 1 position
# note prior position to avoid, avoid and go to next available position..loop>
    attr_reader :maze_map, :map_height, :map_width, :s_loc, :e_loc, :current_loc

    def initialize(maze_file)
        #maze map is a 2x2 array
        @maze_map = IO.readlines(maze_file, chomp: true)
        @map_height =  @maze_map.length
        @map_width =  @maze_map[0].length
        find_start_and_end_points
        @current_loc = @s_loc

    end

    def find_start_and_end_points
        @maze_map.each_with_index do |row, row_idx|
            row.each_char.with_index do |char, col_idx|
                @s_loc = row_idx, col_idx if char == "S" 
                @e_loc = row_idx, col_idx if char == "E" 
            end
        end
    end

    def up
        @current_loc[0] = @current_loc[0] - 1
    end

    def down
        @current_loc[0] = @current_loc[0] + 1
    end
    def left
        @current_loc[1] = @current_loc[1] - 1
    end
    def right
        @current_loc[1] = @current_loc[1] + 1

    end

    

end


play_maze = Maze.new("example_1_maze.txt")
# p play_maze.map_height
# p play_maze.map_width
# p play_maze.s_loc
# p play_maze.e_loc
p play_maze.current_loc
play_maze.right
p play_maze.current_loc



# r,c = play_maze.find_s
# p [r,c]
#puts play_maze.maze_map[6][1]

# if $PROGRAM_NAME == __FILE__
#     Maze.new("example_1_maze_map.txt")
# end
  