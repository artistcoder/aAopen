class Path

    def initialize(starting_point)
        @path_coordinates = [starting_point]
        @current_loc = starting_point
        @prev_loc = starting_point
    end


    def up
        # @current_loc[0] = @current_loc[0] - 1
        # @path_coordinates << @current_loc
        # @current_loc == ""
        # <return potential new path_coordinates
        [@current_loc[0]-1, @current_loc[1]]
    end

    def down
        @current_loc[0] = @current_loc[0] + 1
        @path_coordinates << @current_loc
        @current_loc
    end

    def left
        @current_loc[1] = @current_loc[1] - 1
        @path_coordinates << @current_loc
        @current_loc
    end

    def right
        @current_loc[1] = @current_loc[1] + 1
        @path_coordinates << @current_loc
        @current_loc
    end
end
