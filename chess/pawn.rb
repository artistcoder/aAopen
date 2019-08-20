require_relative 'piece'
require 'colorize'
class Pawn < Piece

    def symbol
        "♙".colorize(color)
    end
    def move_dirs
        if at_start_row?
            side_attacks + forward_steps + [[forward_dir*2,0]]
        else
            side_attacks + forward_steps
        end
    end

    private
    def at_start_row?
        return true if self.color == :white && self.pos[0] == 1 || self.color == :black && self.pos[0] == 6
        return false 
    end

    def forward_dir
        return 1 if self.color == :white
        return -1
    end

    def forward_steps
        [[forward_dir,0]]
    end

    def side_attacks
        [[forward_dir,forward_dir],[forward_dir,-forward_dir]]
    end

end

