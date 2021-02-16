require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'

class Game
  attr_reader :guess_count, :secret_game_code, :timer

  START_MESSAGE = "Welcome to MASTERMIND \n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n>"
  INSTRUCTIONS_MESSAGE = "In this version of MASTERMIND, the player tries to determine a color sequence generated by the computer. \nThe sequence consists of pegs that can be in any number or any order. \nThe player types their guess into the terminal. \nThe computer then tells them the number of colors that are correct and how many of them are in the correct position. \nThe player can use this feedback to make a more educated guess until they get the correct sequence. Thus, winning the game. \n\nWould you like to (p)lay, or (q)uit?"
  GAMEFLOW_MESSAGE = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. \nWhat's your guess?"

  def initialize
    @guess_count = 0
    @secret_game_code = 'no code yet'
    @timer = "time not started yet"
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
    gets.chomp.downcase.strip.delete(' ')
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
    if instructions(input)
      puts INSTRUCTIONS_MESSAGE
      continue_on = false
    elsif play(input)
      continue_on = true
      begin_playing
    else
      quit(input)
      puts "I'm sorry, I don't know what #{input} means. \n\n Please enter (i)nstructions, (p)lay, or (q)uit."
      continue_on = false
    end
    continue_on
  end

  def start_game
    print start_message
    continue = false
    while continue == false
      player_input = get_input
      continue = input_response(player_input)
    end
  end

  def incrament_guess_count
    @guess_count += 1
  end

  def begin_playing
    @timer = Timer.new
    @secret_game_code = SecretCode.new
    puts GAMEFLOW_MESSAGE
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
    if cheat(input)
      puts @secret_game_code.pegs_to_strings
    elsif check_guess_length(input)
      guess = turn_string_into_guess(input)
      turn = Turn.new(@secret_game_code, guess)
      puts evaluate_guess(turn)
      correct_guesses = turn.correct_placement
    else
      puts "I'm sorry, I don't know what #{input} means. \n\n Please enter 'r', 'y', 'g', or 'b', for your guess or (q)uit to exit game."
    end
    correct_guesses
  end

  def turn_string_into_guess(string)
    array_of_colors = string.split(//)
    peg_array = array_of_colors.map do |color|
      peg = Peg.new(color)
    end
    Guess.new(peg_array)
  end

  def evaluate_guess(turn)
    turn.get_correct_placement_count
    turn.get_correct_entities_count
    incrament_guess_count
    feedback(turn.guess.pegs_to_strings, turn.correct_entities, turn.correct_placement, @guess_count)
  end

  def feedback(code, correct_element, correct_position, guess_count)
    "'#{code}' has #{correct_element} of the correct elements with #{correct_position} in the correct positions \n You've taken #{guess_count} guess"
  end

  def check_guess_length(guess)
    code_length = @secret_game_code.pegs.length
    if guess.length > code_length
      p "It's too long"
      return false
    elsif guess.length < code_length
      p "It's too short"
      return false
    else
      return true
    end
  end

  def player_gameflow
    restart = true
    while restart == true
      restart = false
      number_of_correct_guesses = 0
      while number_of_correct_guesses != secret_game_code.pegs.length
        input = get_input
        number_of_correct_guesses = gameflow_input_response(input)
      end
      restart = end_game
    end
  end

  def end_game
    end_message
    play_again?
  end

  def play_again?
    valid_input = false
    while valid_input == false
    input = get_input
      if play(input)
        begin_playing
        valid_input = true
        restart = true
      else
        quit(input)
        puts "I'm sorry I do not understand this input, please try again."
      end
    end
    restart
  end


  def end_message
    @timer.end_time
    puts "Congratulations! You guessed the sequence '#{@secret_game_code.pegs_to_strings}' in #{@guess_count} guesses over #{@timer.elapsed_minutes} minutes, #{@timer.elapsed_seconds} seconds.  \n \n Do you want to (p)lay again or (q)uit?"
  end
end
