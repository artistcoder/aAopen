require_relative "00_tree_node"

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
        queue = [root_node]
        until queue.empty?
            current_node = queue.shift
            new_move_positions(current_node.value).each do |new_pos| 
                new_node = PolyTreeNode.new(new_pos)
                queue << new_node
                current_node.add_child(new_node)
            end
        end
    end

    def self.valid_moves(pos)
        valid_moves =[]
        x,y = pos
        i = 0
        while i < 8
            new_x, new_y = x + X_MOVES[i], y + Y_MOVES[i]
            valid_moves << [new_x, new_y] if KnightPathFinder.in_bounds(new_x,new_y)
            i += 1
        end
        valid_moves
    end

    def self.in_bounds(new_x,new_y)
        new_x >= 0 && new_x <=7 && new_y >=0 && new_y <= 7
    end


    def new_move_positions(pos)
        new_pos = KnightPathFinder.valid_moves(pos).select{|move| !@considered_positions.include?(move)}
        @considered_positions += new_pos
        new_pos
    end

    def find_path(end_pos)
        queue = [root_node]
        until queue.empty?
            node = queue.shift
            return trace_path_back(node) if node.value == end_pos
            node.children.each{|child| queue << child}
        end
        
    end

    def trace_path_back(end_node)
        path = []
        while end_node.parent != nil
            path << end_node
            end_node = end_node.parent
        end
        path << root_node
        path.reverse!
    end


end

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6])
p kpf.find_path([6, 2])