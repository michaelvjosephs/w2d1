require './piece.rb'
require './sliding_piece.rb'

class Rook < Piece

  def initialize(pos, board, color, symbol = :R)
    super
  end

  include SlidingPiece

  def move_dirs
    horizontal_dirs
  end

  def to_s
    color == :white ? "\u2656".encode('utf-8') : "\u265C".encode('utf-8')
  end

end
