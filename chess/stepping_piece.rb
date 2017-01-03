module SteppingPiece

  def moves
    result = []
    move_diffs.each do |diff|
      potential_move = [pos[0] + diff[0], pos[1] + diff[1]]
      result << potential_move unless blocked?(potential_move)
    end

    result
  end

  def move_diffs
  end

end
