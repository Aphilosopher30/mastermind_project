require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'


class GuessTest < Minitest::Test

  def test_it_exists
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    guess = Guess.new([peg1, peg2, peg3, peg4])

    assert_instance_of Guess, guess
  end

  def test_it_has_readable_atributes
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    guess = Guess.new([peg1, peg2, peg3, peg4])

    assert_equal [peg1, peg2, peg3, peg4], guess.pegs
  end

  def test_pegs_to_strings
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    guess = Guess.new([peg1, peg2, peg3, peg4])

    assert_equal 'RGYB', guess.pegs_to_strings
  end

end
