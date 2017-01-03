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
    if @board[pos].is_a?(Piece) && !@board[pos].color.nil?
      return true unless self.color == @board[pos].color
    end

    false
  end

  def move_into_check?(end_pos)
    duped_board = board.dup
    duped_board.move_piece(pos, end_pos)
    duped_board.in_check?(color)
  end

  def valid_moves
    output = []
    moves.each do |move|
      output << move unless move_into_check?(move)
    end

    output
  end
end
