class PolyTreeNode

    attr_reader :parent, :value
    attr_accessor :children
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        return @parent = node if node == nil
        
        if @parent == nil
            @parent = node
            node.children << self
        elsif @parent != nil
            @parent.children.delete(self)
            @parent = node
            node.children << self
        end
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        child_node.parent.children.delete(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end

            #check value of self
            #if value is target value, return. if not, then


    

end