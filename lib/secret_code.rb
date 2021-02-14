require './lib/peg'

class SecretCode
  attr_reader :pegs

  def initialize(pegs = self.create_random_peg_color)
    @pegs = pegs
  end

  def create_random_peg_color
    codebreaker_code = []
    color_options = ['r', 'y', 'b', 'g']
    4.times do
      peg_color = color_options.sample
      peg = Peg.new(peg_color)
      code << peg
    end
    codegreaker_code 
    # possible_colors = []
    # @color_options = ['r', 'y', 'b', 'g']
    # @color_options.each do |color|
    #   400.times {possible_colors << color}
    # end
    # color = possible_colors.shuffle
    # color.slice(0,4)
  end

  def pegs_to_strings
    string = ""
    @pegs.each do |peg|
      string += peg.color
    end
    string.upcase
  end

end
