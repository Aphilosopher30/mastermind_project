require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'

class Game
  attr_reader :guess_count, :secret_game_code, :start_time, :end_time

  START_MESSAGE = "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  INSTRUCTIONS_MESSAGE = "test"
  GAMEFLOW_MESSAGE = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. \nWhat's your guess?"

  def initialize
    @guess_count = 0
    @secret_game_code = 'no code yet'
    @start_time = 0
    @end_time = 0
    @minutes = 0
    @seconds = 0
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
    continue_on = false
    if instructions(input) == true
      puts INSTRUCTIONS_MESSAGE
      continue_on = true
    elsif play(input) == true
      continue_on = true
      begin_game
    else
      quit(input)
      puts "I'm sorry, I don't know what #{input} means. \n\n Please enter (i)nstructions, (p)lay, or (q)uit."
      continue_on = false
    end
      return continue_on
  end



  def start_game
    print self.start_message
    continue = false
    while continue == false
      player_input = self.get_input
      continue = self.input_response(player_input)
    end
  end

  def incrament_guess_count
    @guess_count += 1
  end

  def begin_game
    @start_time = Time.new
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
    quit(input)
    if cheat(input) == true
      p @secret_game_code.pegs_to_strings
    elsif check_guess_length(input) == true
      guess = turn_string_into_guess(input)
      turn = Turn.new(@secret_game_code, guess)
      evaluate_guess(turn)
      correct_guesses = turn.correct_placement
    else
      p "I'm sorry, I don't know what #{input} means. \n\n Please enter 'r', 'y', 'g', 'b', for your guess or (q)uit to exit game."
    end
    return correct_guesses
  end

  def turn_string_into_guess(string)
    array_of_colors = string.split(//)
    peg_array = array_of_colors.map do |color|
      peg = Peg.new(color)
    end
    guess = Guess.new(peg_array)
  end

  def evaluate_guess(turn)
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
    if guess.length > code_length
      p "It's too long"
      return false
    elsif guess.length < code_length
      p "It's too short"
      return false
    else
      true
    end
  end

  def end_message
    @end_time = Time.new
    p "Congratulations! You guessed the sequence '#{@secret_game_code.pegs_to_strings}' in #{@guess_count} guesses over '#{self.elapsed_minutes}' minutes, '#{self.elapsed_seconds}' seconds.  \n \n Do you want to (p)lay again or (q)uit?"
  end

  def elapsed_time_in_seconds
    (@end_time - @start_time).round
  end

  def elapsed_minutes(seconds = self.elapsed_time_in_seconds)
     seconds/60
  end

  def elapsed_seconds(seconds = self.elapsed_time_in_seconds)
    seconds%60
  end


end
