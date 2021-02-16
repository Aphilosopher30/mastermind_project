class GameLevel
  attr_reader :color_amount, :code_length, :all_colors, :current_colors

  def initialize (color_amount, code_length)
    @color_amount = color_amount
    @code_length = code_length
    @all_colors = ['r', 'g', 'b', 'y', 'o', 'w', 'm', 'v']
    @current_colors = create_current_colors_list
  end

  def create_current_colors_list
    @current_colors = @all_colors.slice(0, @color_amount)
  end
end
