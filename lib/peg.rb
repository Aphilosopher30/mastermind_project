class Peg
  attr_reader :color, :match

  def initialize(color)
    @color = color
    @match = false
  end

  def change_match_to_true
    @match = true
  end

  def change_match_to_false
    @match = false
  end

end
