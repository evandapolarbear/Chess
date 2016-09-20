require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  # def render(board)
  #   #@board.board.each_with_index do |cols,idx1|
  #     @board.board.each_with_index do |space, idx2|
  #       print "+---" * 8 + "+" + "\n"
  #       print "|   " * 8 + "|" + "\n"
  #       # print "+---" * 8 + "+" + "\n"
  #     end
  #     print "+---" * 8 + "+" + "\n"
  #     puts "\n"
  #   #end
  # end
  halp = 0
  def render(board)
    @board.board.each_with_index do |col , idx1|
      # print "+---" * 8 + "+" + "\n"
      print "\n|"
      col.each_with_index do |space , idx2|
        if @cursor.cursor_pos == [idx1, idx2]
          print render_cursor
        elsif @board[[idx1, idx2]].is_a?(NullPiece)
          print render_occupied
        else
          print render_unoccupied
        end
      end
    end
  end

  def render_occupied
    return "   |"
  end

  def render_unoccupied
    return " X |"
  end

  def render_cursor
    return " C ".colorize(:red) + "|"
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

display = Display.new(board)
display.cursor_test
