class GameLevel
  attr_reader :color_amount, :code_length, :all_colors, :current_colors

  def initialize (color_amount, code_length)
    @color_amount = color_amount
    @code_length = code_length
    @all_colors = ['r', 'g', 'b', 'y', 'o', 'w', 'm', 'v']
    @current_colors = create_current_colors_list
    @all_color_names = {"r" => "(r)ed",
                         "g" => "(g)reen",
                         "b" =>"(b)lue",
                         "y" => "(y)ellow",
                         "o" => "(o)range",
                         "w" => "(w)ite",
                         "m" =>"(m)aroon",
                         "v" => "(v)iolet"
                       }
  end

  def create_current_colors_list
    @current_colors = @all_colors.slice(0, @color_amount)
  end

  def create_random_peg_array
    codebreaker_code = []
    @code_length.times do
      peg_color = @current_colors.sample
      peg = Peg.new(peg_color)
      codebreaker_code << peg
    end
    codebreaker_code
  end

  def color_string
    array_of_color_names = []
    @current_colors.each do |color|
      array_of_color_names << @all_color_names[color]
    end
    array_of_color_names[0..-2].join(", ") + " and " + array_of_color_names[-1]
  end




end
