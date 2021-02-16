require './lib/peg'
require './lib/guess'
require './lib/secret_code'

class Turn
  attr_reader :secret_code, :guess, :correct_entities, :correct_placement

  def initialize(secret_code, guess)
    @secret_code = secret_code
    @guess = guess
    @correct_entities = get_correct_entities_count
    @correct_placement = get_correct_placement_count
  end

  def evaluate_guess(turn_number)
    feedback(turn_number)
  end

  def compare_pegs?(secret_code_peg, guess_peg)
    if secret_code_peg.match || guess_peg.match
      result = false
    elsif  secret_code_peg.color == guess_peg.color
      result = true
    else
      result = false
    end
    result
  end

  def get_correct_placement_count
    correct_location = 0
    @secret_code.pegs.length.times do |index|
      secret_code_peg = @secret_code.pegs[index]
      guess_peg = @guess.pegs[index]
      if self.compare_pegs?(secret_code_peg, guess_peg)
        correct_location += 1
      end
    end
    correct_location
  end

  def get_correct_entities_count
    correct_colors = 0
    @secret_code.pegs.each do |secret_code_peg|
      @guess.pegs.each do |guess_peg|
        if compare_pegs?(secret_code_peg, guess_peg)
          correct_colors += 1
          secret_code_peg.change_match_to_true
          guess_peg.change_match_to_true
        end
      end
    end
    reset_peg_matches
    correct_colors
  end

  def reset_peg_matches
    @secret_code.pegs.each do |peg|
      peg.change_match_to_false
    end
    @guess.pegs.each do |peg|
      peg.change_match_to_false
    end
  end

  def feedback(guess_count)
    "'#{@guess.pegs_to_strings}' has #{@correct_entities} of the correct elements with #{@correct_placement} in the correct positions \n You've taken #{guess_count} guess"
  end
end
