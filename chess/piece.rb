class Piece

  attr_reader :board, :color, :symbol
  attr_accessor :pos

  def initialize(pos, board, color, symbol = :X)
    @pos = pos
    @board = board
    @color = color
    @symbol = symbol
  end

  def to_s
    "X"
  end

  def blocked?(pos)
    if !@board.in_bounds?(pos)
      return true
    elsif @board[pos].is_a?(Piece)
      return true if self.color == @board[pos].color unless self == @board[pos]
    end

    false
  end

  def has_enemy?(pos)
    if @board[pos].is_a?(Piece)
      return true unless self.color == @board[pos].color
    end

    false
  end

end
