require './piece.rb'

class Pawn < Piece

  attr_accessor :at_start_row

  def initialize(pos, board, color, symbol = :K)
    @at_start_row = true
    super
  end

  def moves
    results = []

    potential_steps = forward_steps.map do |step|
      [pos[0] + step[0], pos[1] + step[1]]
    end

    if !blocked?(potential_steps[0])
      results << potential_steps[0]
      if at_start_row && !blocked?(potential_steps[1])
        results << potential_steps[1]
      end
    end

    side_attacks.each do |attack|
      results << attack if has_enemy?(attack)
    end

    results
  end

  def at_start_row?
    (color == :white && pos[0] == 1) || (color == :black && pos[0] == 6)
  end

  def forward_dir
    # if white, one direction, else other.
    :down if color == :white
  end

  def forward_steps
    forward_dir == :down ? [[1, 0], [2, 0]] : [[-1, 0], [-2, 0]]
  end

  def side_attacks
    forward_dir == :down ? [[1, 1], [1, -1]] : [[-1, 1], [-1, -1]]
  end

  def to_s
    color == :white ? "\u2659".encode('utf-8') : "\u265F".encode('utf-8')
  end
end
