require './lib/peg'
require './lib/guess'
require './lib/secret_code'
require './lib/turn'
require './lib/game'
require './lib/timer'


game = Game.new
game.start_game
game.player_gameflow
