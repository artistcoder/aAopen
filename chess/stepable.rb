module Stepable

    def moves
        x,y = @pos
        moves = []
        move_dirs.each do |dx,dy|
            new_pos = x+dx,y+dy
            moves << new_pos if new_pos[0] >= 0 && new_pos[0] <=7 && new_pos[1] >=0 && new_pos[1] <=7
        end
        moves.select{|move| board[move].color == nil || board[move].color != self.color}
    end

end
