class KnightPathFinder
    X_MOVES = [1,1,-1,-1,2,2,-2,-2]
    Y_MOVES = [2,-2,2,-2,1,-1,1,-1]
    
    def initialize(pos)
        @starting_pos = pos
        #self.root_node = PolyTreeNode.new(@starting_pos)
        @considered_positions = [@starting_pos]
        build_move_tree
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(@starting_pos)

    end

    def self.valid_moves(pos)
        valid_moves =[]
        x,y = pos
        i = 0
        while i < 8
            new_x, new_y = x + X_MOVES[i], y + Y_MOVES[i]
            valid_moves << [new_x, new_y] if in_bounds(new_x,new_y)
            i += 1
        end
        valid_moves
    end

    def in_bounds(new_x,new_y)
        new_x >= 0 && new_x <=7 && new_y >=0 && new_y <= 7
    end


    def new_move_positions(pos)
        new_pos = valid_moves(pos).select{|move| !@considered_positions.include?(move)}
        @considered_positions += new_pos
        new_pos
    end

end

class PolyTreeNode

    def initialize(root_node)
        @value, @children, @parent = root_node, [], nil
    end

end

test = KnightPathFinder.new([0,0])
