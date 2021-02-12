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


end
