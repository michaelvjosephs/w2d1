require './piece.rb'
require './sliding_piece.rb'

class Bishop < Piece

  def initialize(pos, board, color, symbol = :B)
    super
  end

  include SlidingPiece

  def move_dirs
    diagonal_dirs
  end

  def to_s
    color == :white ? "\u2657".encode('utf-8') : "\u265D".encode('utf-8')
  end

end
