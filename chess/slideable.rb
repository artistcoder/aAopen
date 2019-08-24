module Slideable
    HORIZONTAL_VERTICAL_DIRS = [[1,0],[0,1],[-1,0],[0,-1]]
    DIAGONAL_DIRS =   [[1,1],[-1,1],[-1,-1],[1,-1]]
    
    def horizontal_vertical_dirs
        HORIZONTAL_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        moves = []
        x,y = @pos
        move_dirs.each do |dx,dy|
            new_pos = x+dx,y+dy
            if new_pos[0] >= 0 && new_pos[0] <=7 && new_pos[1] >=0 && new_pos[1] <=7
                if board[new_pos].color == nil
                    moves += grow_unblocked_moves_in_dir(dx,dy)
                elsif board[new_pos].color != self.color
                    moves << new_pos
                end
            end
        end
        moves
    end

    private
    def move_dirs
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        x,y = @pos
        new_pos = x+dx, y+dy
        sub_moves = []
        while valid_location?(new_pos) && board[new_pos].color == nil
            sub_moves << new_pos
            x,y = new_pos
            new_pos = x+dx,y+dy
        end
        sub_moves << new_pos if other_team_occupying_location?(new_pos)
        sub_moves
    end

    def valid_location?(new_pos)
        x,y = new_pos
        return true if x >= 0 && x <= 7 && y >= 0 && y <= 7
        return false
    end

    def other_team_occupying_location?(new_pos)
        if valid_location?(new_pos)
            if board[new_pos].class != NullPiece 
                return board[new_pos].color != self.color
            end
        end
        return false
    end



end