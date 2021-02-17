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
    secret_code = SecretCode.new([peg1, peg2, peg3, peg4])

    turn = Turn.new(secret_code, guess)

    assert_equal 4, turn.correct_entities
    assert_equal 0, turn.correct_placement
    assert_equal guess, turn.guess
    assert_equal secret_code, turn.secret_code
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

  def test_get_correct_enteties_count
    peg1 = Peg.new('r')
    peg2 = Peg.new('r')
    peg3 = Peg.new('r')
    peg4 = Peg.new('r')
    peg1a = Peg.new('r')
    peg2a = Peg.new('r')
    peg3a = Peg.new('r')
    peg4a = Peg.new('r')
    peg5 = Peg.new('b')
    peg6 = Peg.new('b')
    peg7 = Peg.new('b')
    peg8 = Peg.new('b')
    peg9 = Peg.new('g')
    peg10 = Peg.new('g')
    peg11 = Peg.new('g')
    peg12 = Peg.new('g')
    peg13 = Peg.new('y')
    peg14 = Peg.new('y')
    peg15 = Peg.new('y')
    peg16 = Peg.new('y')

    secret_code_one_collor_1 = SecretCode.new([peg1, peg2, peg3, peg4])
    guess_all_wrong_1 = Guess.new([peg5, peg6, peg12, peg14])
    guess_some_wrong_1 = Guess.new([peg4a, peg5, peg6, peg7])
    guess_all_correct_1 = Guess.new([peg1a, peg2a, peg3a, peg4a])

    turn_all_wrong_1 = Turn.new(secret_code_one_collor_1, guess_all_wrong_1)
    turn_some_wrong_1 = Turn.new(secret_code_one_collor_1, guess_some_wrong_1)
    turn_all_correct_1 = Turn.new(secret_code_one_collor_1, guess_all_correct_1)


    turn_all_wrong_1.get_correct_entities_count
    turn_some_wrong_1.get_correct_entities_count
    turn_all_correct_1.get_correct_entities_count

    assert_equal 0, turn_all_wrong_1.correct_entities
    assert_equal 1, turn_some_wrong_1.correct_entities
    assert_equal 4, turn_all_correct_1.correct_entities

    secret_code_two_collors_2 = SecretCode.new([peg1, peg5, peg2, peg6])
    guess_all_wrong_2 = Guess.new([peg13, peg14, peg15, peg16])
    guess_some_wrong_2 = Guess.new([peg7, peg10, peg14, peg3])
    guess_some_wrong_2a = Guess.new([peg1a, peg2a, peg3a, peg16])
    guess_all_correct_2 = Guess.new([peg3, peg4, peg7, peg8])

    turn_all_wrong_2 = Turn.new(secret_code_two_collors_2, guess_all_wrong_2)
    turn_some_wrong_2 = Turn.new(secret_code_two_collors_2, guess_some_wrong_2)
    turn_some_wrong_2a = Turn.new(secret_code_two_collors_2, guess_some_wrong_2a)
    turn_all_correct_2 = Turn.new(secret_code_two_collors_2, guess_all_correct_2)


    turn_all_wrong_2.get_correct_entities_count
    turn_some_wrong_2.get_correct_entities_count
    turn_some_wrong_2a.get_correct_entities_count
    turn_all_correct_2.get_correct_entities_count

    assert_equal 0, turn_all_wrong_2.correct_entities
    assert_equal 2, turn_some_wrong_2.correct_entities
    assert_equal 2, turn_some_wrong_2a.correct_entities
    assert_equal 4, turn_all_correct_2.correct_entities

    secret_code_all_collors_4 = SecretCode.new([peg1, peg5, peg9, peg13])
    guess_some_wrong_4 = Guess.new([peg7, peg10, peg14, peg16])
    guess_all_correct_4 = Guess.new([peg10, peg6, peg14, peg2])

    turn_some_wrong_4 = Turn.new(secret_code_all_collors_4, guess_some_wrong_4)
    turn_all_correct_4 = Turn.new(secret_code_all_collors_4, guess_all_correct_4)

    turn_some_wrong_4.get_correct_entities_count
    turn_all_correct_4.get_correct_entities_count

    assert_equal 3, turn_some_wrong_4.correct_entities
    assert_equal 4, turn_all_correct_4.correct_entities
  end

  def test_get_correct_correct_placement_count
    peg_red_1 = Peg.new('r')
    peg_green_2 = Peg.new('g')
    peg_yellow_3 = Peg.new('y')
    peg_blue_4 = Peg.new('b')
    peg_red_5 = Peg.new('r')
    peg_green_6 = Peg.new('g')
    peg_yellow_7 = Peg.new('y')
    peg_blue_8 = Peg.new('b')
    peg_red_9 = Peg.new('r')
    peg_green_10 = Peg.new('g')
    peg_red_11 = Peg.new('r')
    peg_green_12 = Peg.new('g')

    secret_code = SecretCode.new([peg_red_1, peg_green_2, peg_yellow_3, peg_blue_4])
    guess_all_right = Guess.new([peg_red_5, peg_green_6, peg_yellow_7, peg_blue_8])
    guess_some_right = Guess.new([peg_red_5, peg_green_6, peg_blue_8, peg_yellow_7])
    guess_no_right = Guess.new([peg_green_6, peg_yellow_7, peg_blue_8, peg_red_5])

    turn_all_right = Turn.new(secret_code, guess_all_right)
    turn_some_right = Turn.new(secret_code, guess_some_right)
    turn_no_right = Turn.new(secret_code, guess_no_right)

    turn_all_right.get_correct_placement_count
    turn_some_right.get_correct_placement_count
    turn_no_right.get_correct_placement_count

    assert_equal 4, turn_all_right.correct_placement
    assert_equal 2, turn_some_right.correct_placement
    assert_equal 0, turn_no_right.correct_placement

    secret_code_doubles = SecretCode.new([peg_red_1, peg_red_9, peg_green_2, peg_green_10])
    guess_some_right_double = Guess.new([peg_red_5, peg_green_6, peg_red_11, peg_green_12])
    guess_no_right_double = Guess.new([peg_green_12, peg_green_6, peg_red_5, peg_red_11])

    turn_some_right_double = Turn.new(secret_code_doubles, guess_some_right_double)
    turn_no_right_double = Turn.new(secret_code_doubles, guess_no_right_double)

    turn_some_right_double.get_correct_placement_count
    turn_no_right_double.get_correct_placement_count

    assert_equal 2, turn_some_right_double.correct_placement
    assert_equal 0, turn_no_right_double.correct_placement
  end

  def test_reset_peg_matches
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

    turn.secret_code.pegs[0].change_match_to_true
    turn.secret_code.pegs[1].change_match_to_true
    turn.secret_code.pegs[2].change_match_to_true
    turn.secret_code.pegs[3].change_match_to_true
    turn.guess.pegs[0].change_match_to_true
    turn.guess.pegs[1].change_match_to_true
    turn.guess.pegs[2].change_match_to_true
    turn.guess.pegs[3].change_match_to_true

    turn.reset_peg_matches

    assert_equal false, turn.secret_code.pegs[0].match
    assert_equal false, turn.secret_code.pegs[1].match
    assert_equal false, turn.secret_code.pegs[2].match
    assert_equal false, turn.secret_code.pegs[3].match
    assert_equal false, turn.guess.pegs[0].match
    assert_equal false, turn.guess.pegs[1].match
    assert_equal false, turn.guess.pegs[2].match
    assert_equal false, turn.guess.pegs[3].match
  end

  def test_feedback
    peg1 = Peg.new('r')
    peg2 = Peg.new('r')
    peg3 = Peg.new('g')
    peg4 = Peg.new('b')
    guess = Guess.new([peg1, peg2, peg3, peg4])

    peg5 = Peg.new('r')
    peg6 = Peg.new('r')
    peg7 = Peg.new('b')
    peg8 = Peg.new('y')
    secret_code = SecretCode.new([peg5, peg6, peg7, peg8])

    turn = Turn.new(secret_code, guess)

    turn_number = 1

    message = "'RRGB' has 3 of the correct elements with 2 in the correct positions \n You've taken 1 guess"

    assert_equal message, turn.feedback(turn_number)
  end
end
