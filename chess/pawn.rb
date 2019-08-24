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
        moves.select{|x,y| on_board?(x,y)}
    end

    def move_dirs
        side_attacks + forward_steps
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
        new_pos = calculate_new_pos(forward_dir,0)
        start_new_pos = calculate_new_pos(2*forward_dir,0)
        forward_steps = []
        if board[new_pos].class == NullPiece
            forward_steps << [forward_dir,0]
        end
        if at_start_row? && board[start_new_pos].class == NullPiece
            forward_steps << [forward_dir * 2,0]
        end
        forward_steps
    end

    def side_attacks
        moves = []
        deltas = [[forward_dir,forward_dir],[forward_dir,-forward_dir]]
        deltas.each do |dx,dy|
            new_pos = calculate_new_pos(dx,dy)
            if on_board?(new_pos[0],new_pos[1])
                if board[new_pos].class != NullPiece && board[new_pos].color != self.color
                    moves << [dx,dy]
                end
            end
        end
        moves
    end

end

