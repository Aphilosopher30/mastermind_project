class SecretCode
  attr_reader :peg_code
  def initialize (peg_code)
    @peg_code = peg_code
  end
  def create_random_peg_color
    possible_colors = []
    color = []
    color_options = ['r', 'y', 'b', 'g']
    color_options.each do |color|
      4.times {possible_colors << color}
    end
    color = possible_colors.shuffle
    color.slice(0,4)
  end
end
