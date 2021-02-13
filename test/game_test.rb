require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'
require './lib/sequence'
require './lib/turn'
require './lib/game'


class GameTest < Minitest::Test

  def test_that_it_exists
    game = Game.new

    assert_instance_of Game, game
  end


  def test_start_message
    game = Game.new

    message = "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"

    assert_equal message, game.start_message
  end

  def test_instrucitons_message
    game = Game.new

    message = ""

    assert_equal message, game.instructions_message
  end

  def test_feedback
    game = Game.new

    peg1 = Peg.new('r')
    peg2 = Peg.new('r')
    peg3 = Peg.new('g')
    peg4 = Peg.new('b')
    guess = Guess.new([peg1, peg2, peg3, peg4])

    code = guess.pegs_to_strings

    correct_element = 3
    correct_position = 2
    guess_count = 1

    message = "'RRGB' has 3 of the correct elements with 2 in the correct positions\nYou've taken 1 guess"

    assert_equal message, game.feedback(code, correct_element, correct_position, guess_count)

  end





  def test_it_has_a_readable_guess_count
    game = Game.new

    assert_equal 0, game.guess_count
  end

  def test_evaluate_guess
    game = Game.new

    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('r')
    peg6 = Peg.new('g')
    peg7 = Peg.new('y')
    peg8 = Peg.new('b')

    sequence = Sequence.new([peg1, peg2, peg3, peg4])
    guess = Guess.new([peg5, peg6, peg7, peg8])

    turn = Turn.new(sequence, guess)

    feedback = "'RGYB' has 4 of the correct elements with 4 in the correct positions\nYou've taken 0 guess"


    assert_equal feedback, game.evaluate_guess(turn)
  end

  def test_incrament_guess_count
    game = Game.new
    game.incrament_guess_count

    assert_equal 1, game.guess_count
  end

  def test_guess_length
    game = Game.new

    peg1 = Peg.new('r')
    peg2 = Peg.new('g')
    peg3 = Peg.new('y')
    peg4 = Peg.new('b')
    peg5 = Peg.new('r')
    peg6 = Peg.new('g')
    peg7 = Peg.new('y')
    peg8 = Peg.new('b')

    guess1 = Guess.new([peg5, peg6, peg7])
    guess2 = Guess.new([peg1, peg2, peg3, peg4, peg5, peg6])


    assert_equal "It's too short", game.guess_length(guess1)
    assert_equal "It's too long", game.guess_length(guess2)

  end


end
