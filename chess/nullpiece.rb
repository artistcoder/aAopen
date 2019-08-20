require_relative 'piece'
require 'colorize'
require 'singleton'


class NullPiece < Piece
    include Singleton
    attr_reader :symbol
    # class should include the singleton module. 
    # It will not need a reference to the Board - in fact its initialize method should take no arguments.
    # Make sure you have a way to read its color and symbol.

    def initialize
        super
    end
    def moves
        raise ArgumentError.new("Invalid move: chess tile cannot be moved")
    end
    def symbol
       " "
    end

end


# nullpiece = NullPiece.instance
# p nullpiece.pos