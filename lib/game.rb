require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'

class Game
  attr_reader :guess_count

  START_MESSAGE = "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  INSTRUCTIONS_MESSAGE = "test"
  GAMEFLOW_MESSAGE = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n What's your guess?"

  def initialize
    @guess_count = 0
  end

  def start_message
    START_MESSAGE
  end

  def instructions_message
    INSTRUCTIONS_MESSAGE
  end

  def gameflow_message
    GAMEFLOW_MESSAGE
  end

  def get_input
    gets.chomp.downcase
  end

  def play(player_input)
    if player_input == "p" || player_input == "play"
      true
    else
      false
    end
  end

  def instructions(player_input)
    if player_input == "i" || player_input == "instructions"
      true
    else
      false
    end
  end

  def quit(player_input)
    if player_input == "q" || player_input == "quit"
      exit
    end
  end


  def input_response(input)
    if instructions(input) == true
      p INSTRUCTIONS_MESSAGE
    elsif play(input) == true
      #start game
      iteration = true
      p GAMEFLOW_MESSAGE
    else
      quit(input)
      p "I'm sorry, I don't know what #{input} means. \n\n Please enter (i)nstructions, (p)lay, or (q)uit."
    end
  end

# Create these methods for game
  # if they enter p or play - they enter the game flow
  # if they enter i or instructions - gives a instructions message
  # if they enter q our quit - it exits game
  # use .lowercase, .chomp, if imput == p/play return true

  def start_game
    p START_MESSAGE
    iteration = false
    while iteration == false
      user_input = self.get_input
      input_response(user_input)
    end
  end



  def incrament_guess_count
    @guess_count += 1
  end


  ############
  #need game to actually create the the secret code
    #once made then we print game flow message


  #ask for input - enter a guess
  # also can imput q/quit - exit game
  # c/cheat - print out current secret code
    #take string as input and check to see it is the  right length
  # take string input and output the feedback
    # evaluate guess?
  # repeat loop until guess == secret code



  def evaluate_guess (turn)
    turn.get_correct_placement_count
    turn.get_correct_entities_count

    feedback(turn.guess.pegs_to_strings, turn.correct_entities, turn.correct_placement, @guess_count)
  end


#!!!!!!!!
  def feedback(code, correct_element, correct_position, guess_count)
    "'#{code}' has #{correct_element} of the correct elements with #{correct_position} in the correct positions\nYou've taken #{guess_count} guess"
  end


  def check_guess_length(guess)
    code_length = 4
    if guess.pegs.length > code_length
      return "It's too long"
    elsif guess.pegs.length < code_length
      return "It's too short"
    end
  end





  # def end_message(turn, minutes, seconds)
  #   "Congratulations! You guessed the sequence '#{turn.secret_code.pegs_to_strings}' in #{@guess_count} guesses over '#{minutes}' minutes, '#{seconds}' seconds.  \n \n Do you want to (p)lay again or (q)uit?"
  # end

  #need to figure out the minutes and seconds thing AKA time
  # end game method input
    #if p/play play again
    #if q/quit exit game


end
