require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'

class SecretCodeTest < Minitest::Test

  def test_it_exists
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('g')
    peg6 = Peg.new('r')
    peg7 = Peg.new('b')
    peg8 = Peg.new('y')

    guess = Guess.new([peg5, peg6, peg7, peg8])
    secret_code = SecretCode.new([peg1, peg2, peg3, peg4])

    turn = Turn.new(guess, secret_code)

    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('g')
    peg6 = Peg.new('r')
    peg7 = Peg.new('b')
    peg8 = Peg.new('y')

    guess = Guess.new([peg5, peg6, peg7, peg8])
    secret_code = SecretCode.new

    turn = Turn.new(secret_code, guess)


    assert_equal 0, turn.correct_entities
    assert_equal 0, turn.correct_placement
    assert_equal guess, turn.guess
    assert_equal secret_code, turn.secret_code
  end

  def test_get_correct_enteties_count
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('r')
    peg6 = Peg.new('g')
    peg7 = Peg.new('y')
    peg8 = Peg.new('b')

    secret_code = SecretCode.new([peg1, peg2, peg3, peg4])
    guess1 = Guess.new([peg5, peg6, peg7, peg8])
    guess2 = Guess.new([peg6, peg5, peg8, peg7])

    turn1 = Turn.new(secret_code, guess1)
    turn2 = Turn.new(secret_code, guess2)

    turn1.get_correct_entities_count
    turn2.get_correct_entities_count

    assert_equal 4, turn1.correct_entities
    assert_equal 4, turn2.correct_entities
  end

  def test_compare_pegs?
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('r')
    peg6 = Peg.new('g')
    peg7 = Peg.new('b')
    peg8 = Peg.new('y')

    secret_code = SecretCode.new([peg1, peg2, peg3, peg4])
    guess = Guess.new([peg5, peg6, peg7, peg8])

    turn = Turn.new(secret_code, guess)

    assert_equal false, turn.compare_pegs?(peg1, peg8)
    assert_equal true, turn.compare_pegs?(peg1, peg5)
  end


  def test_get_correct_correct_placement_count
    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('r')
    peg6 = Peg.new('g')
    peg7 = Peg.new('y')
    peg8 = Peg.new('b')

    secret_code = SecretCode.new([peg1, peg2, peg3, peg4])
    guess = Guess.new([peg5, peg6, peg7, peg8])

    turn = Turn.new(secret_code, guess)

    turn.get_correct_placement_count

    assert_equal 4, turn.correct_placement
  end
end
