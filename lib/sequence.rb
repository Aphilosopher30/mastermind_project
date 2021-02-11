class Sequence
  attr_reader :pegs

  def initialize(pegs)
    @pegs = pegs
  end


  def get_correct_guesses_count(guess)
    count = 0
    @pegs.length.times do |index|
      if compare_pegs?(guess, index) == true
        count += 1
      else
        count
      end
    end
    return count
  end

  def compare_pegs?(guess, index)
    sequence_peg = @pegs[index]
    guess_peg = guess.pegs[index]
    if sequence_peg.color == guess_peg.color && sequence_peg.match == false && guess_peg.match == false
      sequence_peg.change_match_to_true
      guess_peg.change_match_to_true
      result = true
    else
      result = false
    end
    return result
  end


  def sequence_pegs_to_strings
    string = ""
    @pegs.each do |peg|
      string += peg.color
    end
    string.upcase
  end



end
