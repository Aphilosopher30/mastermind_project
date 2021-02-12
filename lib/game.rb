require './lib/peg'
require './lib/guess'
require './lib/sequence'
require './lib/turn'

class Game
  START_MESSAGE = "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  INSTRUCTIONS_MESSAGE = ""

  def initialize
  end

  def start_message
    START_MESSAGE
  end

  def instructions_message
    INSTRUCTIONS_MESSAGE
  end




  ############





#!!!!!!!!
  def feedback(code, correct_element, correct_position, guess_count)
    "'#{code}' has #{correct_element} of the correct elements with #{correct_position} in the correct positions\nYou've taken #{guess_count} guess"
  end

end
