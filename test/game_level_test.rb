require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/secret_code'
require './lib/game_level'
require './lib/game'


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

  def test_color_string
    game_level = GameLevel.new(4,4)
    string = game_level.color_string

    assert_equal "(r)ed, (g)reen, (b)lue and (y)ellow", string
  end

  def test_are_all_pegs_valid_colors?
    game_level1 = GameLevel.new(4,5)
    game_level2 = GameLevel.new(6,6)
    game_level3 = GameLevel.new(6,6)


    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('o')
    peg6 = Peg.new('x')

    peg_list1 = [peg1, peg2, peg3, peg4]
    peg_list2 = [peg1, peg2, peg3, peg4, peg5]
    peg_list3 = [peg1, peg2, peg3, peg4, peg5, peg6]

    assert_equal true, game_level1.are_all_pegs_valid_colors?(peg_list1)
    assert_equal false, game_level1.are_all_pegs_valid_colors?(peg_list2)
    assert_equal true, game_level2.are_all_pegs_valid_colors?(peg_list2)
    assert_equal false, game_level3.are_all_pegs_valid_colors?(peg_list3)
  end
end
