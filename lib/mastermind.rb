require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'
require './lib/game'


game = Game.new

game.start_game
restart = true
while restart == true
  restart = false
  number_of_correct_guesses = 0
  while number_of_correct_guesses != game.secret_game_code.pegs.length
    input = game.get_input
    number_of_correct_guesses = game.gameflow_input_response(input)
  end
  game.end_message
  valid_input = false
  while valid_input == false
  input = game.get_input
    if game.play(input)
      game.begin_playing
      valid_input = true
      restart = true
    else
      game.quit(input)
      puts "I'm sorry I do not understand this input, please try again."
    end
  end
end
