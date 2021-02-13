require './lib/peg'
require './lib/guess'
require './lib/sequence'
require './lib/turn'

class Game
  attr_reader :guess_count

  START_MESSAGE = "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  INSTRUCTIONS_MESSAGE = ""


  def initialize
    @guess_count = 0
  end

  def start_message
    START_MESSAGE
  end

  def instructions_message
    INSTRUCTIONS_MESSAGE
  end


  def incrament_guess_count
    @guess_count += 1
  end


  ############


  #ask for input
    #take string as input and check to see it is the  right length
  # take string input and out put the message report

  def evaluate_guess (turn)
    turn.get_correct_placement_count
    turn.get_correct_entities_count

    feedback(turn.guess.pegs_to_strings, turn.correct_entities, turn.correct_placement, @guess_count)
  end


#!!!!!!!!
  def feedback(code, correct_element, correct_position, guess_count)
    "'#{code}' has #{correct_element} of the correct elements with #{correct_position} in the correct positions\nYou've taken #{guess_count} guess"
  end


  def guess_length(guess)
    code_length = 4
    if guess.pegs.length > code_length
      return "It's too long"
    elsif guess.pegs.length < code_length
      return "It's too short"
    end
  end





  # def end_message(turn, minutes, seconds)
  #   "Congratulations! You guessed the sequence '#{turn.sequence.pegs_to_strings}' in #{@guess_count} guesses over '#{minutes}' minutes, '#{seconds}' seconds.  \n \n Do you want to (p)lay again or (q)uit?"
  # end




end
