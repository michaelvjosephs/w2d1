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

module SlidingPiece

  def moves
    result = []
    directions = move_dirs
    directions.each do |dir|
      result += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end

    result
  end

  private

  def move_dirs

  end

  def horizontal_dirs
    [
      [ 1,  0],
      [-1,  0],
      [ 0,  1],
      [ 0, -1]
    ]
  end

  def diagonal_dirs
    [
      [-1, -1],
      [ 1, -1],
      [ 1,  1],
      [-1,  1]
    ]
  end

  def grow_unblocked_moves_in_dir(dy, dx)
    # three condtions: blocked by same color,
    # into enemy color,
    # blocked by board edge.
    results = [pos]

    until blocked?(results.last) || has_enemy?(results.last)
      results << [results.last[0] + dy, results.last[1] + dx]
    end

    results.drop(1)
  end

  def blocked?(pos)
    if !board.in_bounds?(pos)
      true
    elsif board[pos].is_a?(Piece)
      true if self.color == board[pos].color unless self == board[pos]
    end

    false
  end

  def has_enemy?(pos)
    if board[pos].is_a?(Piece)
      true unless self.color == board[pos].color
    end

    false
  end

end

module SteppingPiece

end
