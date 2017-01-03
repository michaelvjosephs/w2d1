require_relative "queen.rb"
require "byebug"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @grid.each_index do |row|
      @grid[row].each_index do |col|
        self[[row, col]] = Queen.new([row, col], self, :white) if [0, 1].include?(row)
        self[[row, col]] = Queen.new([row, col], self, :black) if [6, 7].include?(row)
      end
    end
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

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def pos_occupied?(pos)
    !self[pos].nil?
  end

end

# b = Board.new
