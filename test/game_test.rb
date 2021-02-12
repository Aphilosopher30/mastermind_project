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

end
