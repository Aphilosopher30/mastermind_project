require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'
require './lib/sequence'


class SequenceTest < Minitest::Test

  def test_it_exists
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    sequence = Sequence.new([peg1, peg2, peg3, peg4])

    assert_instance_of Sequence, sequence
  end

  def test_it_has_readable_attributes
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    sequence = Sequence.new([peg1, peg2, peg3, peg4])

    assert_equal [peg1, peg2, peg3, peg4], sequence.pegs
  end

  def test_sequence_pegs_to_strings
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    sequence = Sequence.new([peg1, peg2, peg3, peg4])

    assert_equal "RGYB", sequence.sequence_pegs_to_strings
  end

  def test_get_correct_guesses_count
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('g')
    peg6 = Peg.new('r')
    peg7 = Peg.new('b')
    peg8 = Peg.new('y')
    sequence = Sequence.new([peg1, peg2, peg3, peg4])
    guess1 = Guess.new([peg5, peg6, peg7, peg8])
    guess2 = Guess.new([peg6, peg5, peg8, peg7])

    assert_equal 0, sequence.get_correct_guesses_count(guess1)
    assert_equal 4, sequence.get_correct_guesses_count(guess2)
  end

  def test_compare_pegs?
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('g')
    peg6 = Peg.new('r')
    peg7 = Peg.new('b')
    peg8 = Peg.new('y')
    sequence = Sequence.new([peg1, peg2, peg3, peg4])
    guess1 = Guess.new([peg5, peg6, peg7, peg8])
    guess2 = Guess.new([peg6, peg5, peg8, peg7])

    assert_equal false, sequence.compare_pegs?(guess1, 0)
    assert_equal true, sequence.compare_pegs?(guess2, 0)
  end



end

# def test_randomize_pegs
#   peg1 = Peg.new('r')
#   peg2 = Peg.new('g')
#   peg3 = Peg.new('y')
#   peg4 = Peg.new('b')
#   sequence = Sequence.new([peg1, peg2, peg3, peg4])
#
# array.shuffle.slice(0,4) 
# end
