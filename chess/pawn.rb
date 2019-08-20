require_relative 'piece'
require 'colorize'
class Pawn < Piece

    def symbol
        "♙".colorize(color)
    end
    def moves
        x,y = @pos
        moves = move_dirs.map do |dx,dy|
            [x+dx,y+dy]
        end
        moves
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
        return true if self.color == :magenta && self.pos[0] == 1 || self.color == :green && self.pos[0] == 6
        return false 
    end

    def forward_dir
        return 1 if self.color == :magenta
        return -1
    end

    def forward_steps
        [[forward_dir,0]]
    end

    def side_attacks
        moves = []
        deltas = [[forward_dir,forward_dir],[forward_dir,-forward_dir]]
        x,y = pos
        deltas.each do |dx,dy|
            new_pos = x+dx,y+dy
            if !board[new_pos].is_a? NullPiece
                if board[new_pos].color != self.color
                    moves << [dx,dy]
                end
            end
        end
        moves
    end

end

