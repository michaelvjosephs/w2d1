class Piece

  attr_reader :pos, :board, :color, :symbol

  def initialize(pos, board, color, symbol = :X)
    @pos = pos
    @board = board
    @color = color
    @symbol = symbol
  end

  def to_s
    "X"
  end

end

class NullPiece < Piece

end
