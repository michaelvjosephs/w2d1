require './piece.rb'
require './stepping_piece.rb'

class Knight < Piece

  def initialize(pos, board, color, symbol = :H)
    super
  end

  include SteppingPiece

  def move_diffs
    [
      [ 2,  1],
      [ 2, -1],
      [-2,  1],
      [-2, -1],
      [-1, -2],
      [ 1, -2],
      [ 1,  2],
      [-1,  2]
    ]
  end

  def to_s
    color == :white ? "\u2658".encode('utf-8') : "\u265E".encode('utf-8')
  end

end
