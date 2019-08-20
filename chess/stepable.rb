module Stepable

    def moves
        x,y = @pos
        moves = move_dirs.map do |dx,dy|
            [x+dx,y+dy]
        end

    end

end
