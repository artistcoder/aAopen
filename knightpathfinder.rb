class KnightPathFinder
    attr_accessor :root_node

    X_MOVES = [1,1,-1,-1,2,2,-2,-2]
    Y_MOVES = [2,-2,2,-2,1,-1,1,-1]
    
    def initialize(pos)
        @starting_pos = pos
        @considered_positions = [@starting_pos]
        build_move_tree
    end

    def build_move_tree
        self.root_node = PolyTreeNode.new(@starting_pos)
        #nodes should rep all possible positions 1 step away, 2 steps away
        queue = [self.root_node]
        until queue.empty?
            current_node = queue.shift
            new_move_positions(current_node.value).each{|new_pos| queue << new_pos}
        end
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
        new_pos = KnightPathFinder.valid_moves(pos).select{|move| !@considered_positions.include?(move)}
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
