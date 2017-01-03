require './piece.rb'
require './stepping_piece.rb'

class King < Piece

  def initialize(pos, board, color, symbol = :K)
    super
  end

  include SteppingPiece

  def move_diffs
    [
      [ 1,  0],
      [-1,  0],
      [ 0,  1],
      [ 0, -1],
      [-1, -1],
      [ 1, -1],
      [ 1,  1],
      [-1,  1]
    ]
  end

  def to_s
    color == :white ? "\u2654".encode('utf-8') : "\u265A".encode('utf-8')
  end

end
