require 'minitest/autorun'
require 'minitest/pride'
require './lib/peg'
require './lib/guess'
require './lib/turn'
require './lib/game'
require './lib/secret_code'



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

    message = "test"

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

    message = "'RRGB' has 3 of the correct elements with 2 in the correct positions \n You've taken 1 guess"

    assert_equal message, game.feedback(code, correct_element, correct_position, guess_count)

  end

  def test_it_has_readable_attributes
    game = Game.new

    assert_equal 'no code yet', game.secret_game_code
    assert_equal 0, game.guess_count
    assert_equal 0, game.start_time
    assert_equal 0, game.end_time
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

    secret_code = SecretCode.new([peg1, peg2, peg3, peg4])
    guess = Guess.new([peg5, peg6, peg7, peg8])

    turn = Turn.new(secret_code, guess)

    feedback = "'RGYB' has 4 of the correct elements with 4 in the correct positions \n You've taken 1 guess"

    assert_equal feedback, game.evaluate_guess(turn)
  end

  def test_incrament_guess_count
    game = Game.new
    game.incrament_guess_count

    assert_equal 1, game.guess_count
  end

  def test_check_guess_length
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


    assert_equal false, game.check_guess_length(guess1)
    assert_equal  false, game.check_guess_length(guess2)

  end

  def test_play
    game = Game.new

    assert_equal true, game.play("p")
    assert_equal true, game.play("play")
    assert_equal false, game.play("i")
  end


  def test_instructions
    game = Game.new

    assert_equal true, game.instructions("i")
    assert_equal true, game.instructions("instructions")
    assert_equal false, game.instructions("p")
  end

  def test_quit
    skip
    game = Game.new

    assert_equal exit, game.instructions("q")
    assert_equal exit, game.instructions("quit")
  end

  def test_input_response
    skip
    game = Game.new

    input = "i"

    assert_equal "test", game.input_response(input)
  end

  def test_begin_game
    skip
    game = Game.new
    game.begin_game

    expected = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n What's your guess?"

    assert_equal expected, game.gameflow_message
    assert_instance_of SecretCode, game.secret_game_code
  end

  def test_cheat
    game = Game.new

    assert_equal true, game.cheat("c")
    assert_equal true, game.cheat("cheat")
    assert_equal false, game.cheat("i")
  end

  def test_elapsed_time_in_seconds
    game = Game.new

    assert_equal 0, game.elapsed_time_in_seconds
  end

  def test_elapsed_minutes
    game = Game.new

    time_test1 = 5
    time_test2 = 59
    time_test3 = 95
    time_test4 = 137
    assert_equal 0, game.elapsed_minutes(time_test1)
    assert_equal 0, game.elapsed_minutes(time_test2)
    assert_equal 1, game.elapsed_minutes(time_test3)
    assert_equal 2, game.elapsed_minutes(time_test4)
  end

  def test_elapsed_seconds
    game = Game.new

    time_test1 = 5
    time_test2 = 59
    time_test3 = 95
    time_test4 = 137
    assert_equal 5, game.elapsed_seconds(time_test1)
    assert_equal 59, game.elapsed_seconds(time_test2)
    assert_equal 35, game.elapsed_seconds(time_test3)
    assert_equal 17, game.elapsed_seconds(time_test4)
  end

end
