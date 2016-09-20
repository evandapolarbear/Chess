class Piece

  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s(piece_sym)
    "  #{piece_sym} |"
  end

end
