require './lib/peg'
require './lib/guess'
require './lib/sequence'

class Turn
  attr_reader :sequence, :guess, :correct_entities, :correct_placement

  def initialize(sequence, guess)
    @sequence = sequence
    @guess   = guess
    @correct_entities = 0
    @correct_placement = 0
  end

  def compare_pegs?(sequence_peg, guess_peg)
    if sequence_peg.match || guess_peg.match
      result = false
    elsif  sequence_peg.color == guess_peg.color
      result = true
    else
      result = false
    end
    return result
  end

  def get_correct_placement_count
    @sequence.pegs.length.times do |index|
      index = 0
      sequence_peg = @sequence.pegs[index]
      guess_peg = @guess.pegs[index]
      if self.compare_pegs?(sequence_peg, guess_peg)
        @correct_placement += 1
      end
    end
  end

  def get_correct_entities_count
    @sequence.pegs.each do |sequence_peg|
      @guess.pegs.each do |guess_peg|
        if compare_pegs?(sequence_peg, guess_peg)
            @correct_entities += 1
            sequence_peg.change_match_to_true
            guess_peg.change_match_to_true
        end
      end
    end
    reset_matches
  end


  def reset_matches
    @sequence.pegs.each do |peg|
      peg.change_match_to_false
    end
    @guess.pegs.each do |peg|
      peg.change_match_to_false
    end
  end




end
