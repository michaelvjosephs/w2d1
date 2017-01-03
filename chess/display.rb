require 'colorize'
require_relative './cursor.rb'
require_relative './board.rb'
require 'byebug'

class Display
attr_accessor :cursor, :board

  def initialize(pos = [0,0], board = Board.new)
    @cursor = Cursor.new(pos, board)
    @board = board
  end

  def display
    while true
      render
      # debugger
      cursor.get_input
    end
  end

  def render
    system("clear")
    puts "  #{(0...8).to_a.join(" ")}"
    board.grid.each_with_index do |row, i|
      print "#{i} "
      row.each_with_index do |col, j|
        if cursor.cursor_pos == [i,j]
            # if col.is_a?(NullPiece)
            #   print " ".colorize(color: :red, background: :light_cyan)
            # else
              print "#{board[[i,j]].to_s.colorize(color: :red, background: :light_cyan)} "
            # end
        else
          print "#{col} "
        end
      end
      print "\n"
    end
  end


end

d = Display.new
d.render
d.board.move_piece([6,5],[5,5])
d.render
p d.board.in_check?(:white)
puts "made valid move"
d.board.move_piece([1,4], [3,4])
d.render
p d.board.in_check?(:white)
puts "made second valid move"
d.board.move_piece([6,6], [4,6])
d.render
p d.board.in_check?(:white)
puts "move to almost checkmate"
d.board.move_piece([0,3], [4,7])
d.render
p d.board.in_check?(:white)
puts "move to checkmate"
p d.board.checkmate?(:white)
