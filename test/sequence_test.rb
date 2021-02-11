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

  # def test_randomize_pegs
  #   peg1 = Peg.new('r')
  #   peg2 = Peg.new('g')
  #   peg3 = Peg.new('y')
  #   peg4 = Peg.new('b')
  #   sequence = Sequence.new([peg1, peg2, peg3, peg4])
  #
  # array.shuffle.slice(0,4) 
  # end
end
