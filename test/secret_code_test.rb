require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'
require './lib/secret_code'

class SecretCodeTest < Minitest::Test

  def test_it_exists
    secret_code = SecretCode.new

    assert_instance_of SecretCode, secret_code
  end

  def test_it_has_readable_attributes
    secret_code = SecretCode.new

    assert_equal 4, secret_code.pegs.length
    assert_instance_of Array, secret_code.pegs
  end

  def test_pegs_to_strings

    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    guess = SecretCode.new([peg1, peg2, peg3, peg4])

    assert_equal 'RGYB', guess.pegs_to_strings

    secret_code = SecretCode.new

    assert_equal 4, secret_code.pegs_to_strings.length
    assert_instance_of String, secret_code.pegs_to_strings
  end


end
