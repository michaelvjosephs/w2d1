require './piece.rb'
require './sliding_piece.rb'

class Queen < Piece

  def initialize(pos, board, color, symbol = :Q)
    super
  end

  include SlidingPiece

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  def to_s
    "Q"
  end

end
