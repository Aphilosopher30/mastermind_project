class SecretCode
  attr_reader :peg_code
  def initialize
    @peg_code = self.create_random_peg_color
  end
  def create_random_peg_color
    possible_colors = []
    color = []
    color_options = ['r', 'y', 'b', 'g']
    color_options.each do |color|
<<<<<<< HEAD
      40.times {possible_colors << color}
=======
      400.times {possible_colors << color}
>>>>>>> a3af37cd68d80dc0ca9dd54d567c5bd0ed83f650
    end
    color = possible_colors.shuffle
    color.slice(0,4)
  end
end

#we want the random code to equal
