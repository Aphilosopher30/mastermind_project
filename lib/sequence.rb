class Sequence
  attr_reader :pegs

  def initialize(pegs)
    @pegs = pegs
  end

  def sequence_pegs_to_strings
    string = ""
    @pegs.each do |peg |
      string += peg.color
    end
    string.upcase
  end



end
