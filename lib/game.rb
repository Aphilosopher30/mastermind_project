require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'

class Game
  attr_reader :guess_count, :secret_game_code, :start_time, :end_time

  START_MESSAGE = "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  INSTRUCTIONS_MESSAGE = "test"
  GAMEFLOW_MESSAGE = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n What's your guess?"

  def initialize
    @guess_count = 0
    @secret_game_code = 'no code yet'
    @start_time = 0
    @end_time = 0
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

  def begin_game
    @secret_game_code = SecretCode.new
    p GAMEFLOW_MESSAGE
  end

  def cheat(player_input)
    if player_input == "c" || player_input == "cheat"
      true
    else
      false
    end
  end

  def gameflow_input_response(input)
    correct_guesses = 0
    if cheat(input) == true
      p @secret_game_code.pegs_to_strings
    elsif game.check_guess_length(input) == true
      turn = Turn.new(@secret_game_code, input)
      evaluate_guess(turn)
      correct_guesses = turn.correct_placement
    else
      quit(input)
      p "I'm sorry, I don't know what #{input} means. \n\n Please enter 'r', 'y', 'g', 'b', for your guess or (q)uit to exit game."
    end
    return correct_guesses
  end

  def evaluate_guess (turn)
    turn.get_correct_placement_count
    turn.get_correct_entities_count

    incrament_guess_count

    feedback(turn.guess.pegs_to_strings, turn.correct_entities, turn.correct_placement, @guess_count)
  end

  def feedback(code, correct_element, correct_position, guess_count)
    p "'#{code}' has #{correct_element} of the correct elements with #{correct_position} in the correct positions \n You've taken #{guess_count} guess"
  end

  def check_guess_length(guess)
    code_length = 4
    if guess.pegs.length > code_length
      p "It's too long"
      return false
    elsif guess.pegs.length < code_length
      p "It's too short"
      return false
    else
      true
    end
  end

  def end_message
    p "Congratulations! You guessed the sequence '#{@secret_game_code.pegs_to_strings}' in #{@guess_count} guesses over '#{elapsed_minutes}' minutes, '#{elapsed_seconds}' seconds.  \n \n Do you want to (p)lay again or (q)uit?"
  end

# create new game somehow.

  def elapsed_time_in_seconds
    (@end_time - @start_time).round
  end

  def elapsed_minutes(seconds = elapsed_time_in_seconds)
    seconds/60
  end

  def elapsed_seconds(seconds = elapsed_time_in_seconds)
    seconds%60
  end
end
