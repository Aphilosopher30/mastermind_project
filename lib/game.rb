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



end
