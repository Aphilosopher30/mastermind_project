require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'
require './lib/game'
require './lib/timer'


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

  restart = game.end_game
end
