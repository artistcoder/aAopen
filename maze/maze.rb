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

def initialize(maze_file)
    #maze map is a 2x2 array
    @maze_map = IO.readlines(maze_file)
    @loc = find_s
end

end

def find_s
    puts "hi"
    @maze_map.each do |row, row_idx|
        @maze_map.each do |ele, col_idx|
            puts @maze_map[row_idx][col_idx]
            if ele == "S"
                puts row_idx.to_s + ", " + col_idx.to_s
            end
        end
    end

end


Maze.new("example_1_maze.txt")

# if $PROGRAM_NAME == __FILE__
#     Maze.new("example_1_maze_map.txt")
# end
  