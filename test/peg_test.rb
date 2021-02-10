require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'


class PegTest < Minitest::Test

  def test_it_exists
    red_peg = Peg.new("r")
    assert_instance_of Peg, red_peg
  end

  def test_it_has_readable_atributes
    red_peg = Peg.new("r")

    assert_equal "r", red_peg.color
  end

  def test_it_has_match_attribute
    red_peg = Peg.new("r")

    assert_equal false, red_peg.match
  end

  def test_change_match_to_true
    red_peg = Peg.new("r")
    red_peg.change_match_to_true

    assert_equal true, red_peg.match
  end

  def test_change_match_to_false
    red_peg = Peg.new("r")
    red_peg.change_match_to_true

    assert_equal true, red_peg.match
    red_peg.change_match_to_false

    assert_equal false, red_peg.match
  end

end
