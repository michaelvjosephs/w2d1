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
        if board[cursor.cursor_pos] == board[[i,j]]
          # if cursor.selected
            print "#{col.to_s.colorize(color: :red, background: :light_cyan)} "
          # else
          #   print "#{col.to_s.colorize(color: :light_cyan, background: :red)} "
          # end
        else
          print "#{col} "
        end
      end
      print "\n"
    end
  end


end
