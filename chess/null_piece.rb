require './piece.rb'
require 'singleton'

class NullPiece < Piece

  def initialize

  end

  include Singleton

  def to_s
    " "
  end
end
