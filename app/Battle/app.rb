require 'sinatra'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  attr_reader :player_one_name, :player_two_name

  get '/battle' do
    erb :index
  end

  post '/names' do
    player_one = Player.new(params[:player_one_name])
    player_two = Player.new(params[:player_two_name])
# $variables are global variables and are bad practice, do not use in the future
    $game = Game.new(player_one, player_two)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.show_opponent_turn)
    erb :attack
  end

  get '/change_turn' do
    @game = $game
    @game.attack(@game.show_opponent_turn)
    erb :attack_p2
  end

  run! if app_file == $0

end
