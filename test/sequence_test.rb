require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'


class SequenceTest < Minitest::Test

  def test_it_exists
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    sequence = Sequence.new([peg1, peg2, peg3, peg4])

    assert_instance_of Sequence, sequence
  end


end
