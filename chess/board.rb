require_relative "knight.rb"
require_relative "king.rb"
require_relative "pawn.rb"
require_relative "queen.rb"
require_relative "bishop.rb"
require_relative "rook.rb"
require_relative "null_piece.rb"
require "byebug"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    make_starting_grid
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)
    raise "No piece here" if self[start_pos].nil?
    raise "Out of bounds or piece in the way" if !in_bounds?(end_pos) || pos_occupied?(end_pos)
    raise "Not a valid move for this piece" unless self[start_pos].moves.include?(end_pos)
    piece = self[start_pos]
    piece.pos = end_pos
    self[start_pos] = nil
    self[end_pos] = piece
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def pos_occupied?(pos)
    !self[pos].nil?
  end

  def make_starting_grid
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        color = :white if row < 2
        color = :black if row > 5
        if row == 0 || row == 7
          case col
          when 0, 7
            self[[row, col]] = Rook.new([row, col], self, color)
          when 1, 6
            self[[row, col]] = Knight.new([row, col], self, color)
          when 2, 5
            self[[row, col]] = Bishop.new([row, col], self, color)
          when 3
            self[[row, col]] = King.new([row, col], self, color)
          when 4
            self[[row, col]] = Queen.new([row, col], self, color)
          end
        elsif row == 1 || row == 6
          self[[row, col]] = Pawn.new([row, col], self, color)
        else
          self[[row, col]] = NullPiece.instance
        end
      end
    end
  end
end
