class NullPiece

  def self.instance
    if self.class.instance_of?(NullPiece)
      self.class
    else
      NullPiece.new
    end
  end

  def occupied?(pos)
    poss = pos
    false
  end

end
