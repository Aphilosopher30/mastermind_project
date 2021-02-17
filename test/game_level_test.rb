require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/secret_code'
require './lib/game_level'

class GameLevelTest < Minitest::Test

  def test_that_it_exists
    game_level = GameLevel.new(4, 4)

    assert_instance_of GameLevel, game_level
  end

  def test_it_has_readable_attributes
    game_level = GameLevel.new(4, 4)

    assert_equal 4, game_level.color_amount
    assert_equal 4, game_level.code_length
    assert_equal ['r', 'g', 'b', 'y', 'o', 'w', 'm', 'v'], game_level.all_colors
    assert_equal ['r', 'g', 'b', 'y'], game_level.current_colors
  end

  def test_create_current_colors_list
    game_level = GameLevel.new(4, 4)
    assert_equal ['r', 'g', 'b', 'y'], game_level.current_colors
  end

  def test_create_random_peg_color
    game_level = GameLevel.new(4,4)

    valid_colors = game_level.create_random_peg_array.all? do |peg|
      game_level.all_colors.include?(peg.color)
    end 

    assert_equal 4, game_level.create_random_peg_array.length
    assert_instance_of Array, game_level.create_random_peg_array
    assert_equal true, valid_colors
  end
end
