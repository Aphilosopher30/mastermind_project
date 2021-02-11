
def initialize(pegs)
    @pegs = pegs
    @correct_place_color_count = 0
    @just_correct_color_count = 0
  end
  def get_correct_guesses_count(guess)
    @pegs.length.times do |index|
      if compare_pegs?(guess, index) == true
        @correct_place_color_count += 1
      else
        @correct_place_color_count
      end
    end
    return @correct_place_color_count
  end


def just_correct_colors_count(guess)
    @pegs.each do |peg1|
      guess.pegs.each do |peg2|
        if peg1.color == peg2.color && peg1.match == false && peg2.match == false
          @just_correct_color_count += 1
          peg1.change_match_to_true
          peg2.change_match_to_true
        else
          @just_correct_color_count
        end
      end
    end
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
