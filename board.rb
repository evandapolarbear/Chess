require_relative "null_piece.rb"

class Board

  attr_accessor :board

  def initialize()
    @board = Array.new(8) {Array.new(8){NullPiece.new}}
  end

  def move(start, end_pos)
    if move_valid?(start, end_pos)
      piece_to_move = @board[start]
      @board[end_pos]= piece_to_move
      @board[start]= NullPiece.instance
    end
  end

  def move_valid?(start, end_pos)

    end_row, end_col = end_pos
    #needs to see if still on board at end
    #piece at start?
    #piece on board
    raise StandardError if @board[start] == NullPiece.instance
    raise StandarError if (end_row < 0 || end_col < 0) || (end_row > 8 || end_col > 8)
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []= (pos, value)
    row, col = pos
    @board[row][col]= value
  end

  def occupied?(pos)
    false
    # return false unless @board[pos].is_a(NullPiece)
  end
end

# p Board.new
