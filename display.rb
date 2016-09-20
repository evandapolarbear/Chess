require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render(board)
    @board.board.each_with_index do |col , idx1|
      # print "+---" * 8 + "+" + "\n"
      print "\n"
      col.each_with_index do |space , idx2|
        print space.to_s
        if @cursor.cursor_pos == [idx1, idx2]
          print render_cursor(idx1, idx2)
        # else
        #   print "X"
        # elsif @board[[idx1, idx2]].is_a?(NullPiece)
        #   print render_occupied
        # else
        #   print render_unoccupied
        end
        print "|    "
      end
    end
  end

  def render_occupied
    return "   |"
  end

  def render_unoccupied
    return " X |"
  end

  def render_cursor(idx1, idx2)
    @board[[idx1, idx2]].to_s.colorize(:background => :yellow) #Background hasshhhhhhhhhhhhhish
  end

  def cursor_test
    render(@board)
    while true
      @cursor.get_input
      render(@board)
      # system('clear')
    end
  end
end

board = Board.new

Display.new(board).cursor_test
