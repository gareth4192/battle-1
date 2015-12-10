require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1_name])
    player_2 = Player.new('Computer')
    $game = Game.new(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    @game = $game
    erb :play
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.other_player)
    redirect '/game_over' if @game.other_player.hit_points <= 0
    redirect '/play'
  end

  get '/heal' do
    @game = $game
    @game.heal(@game.current_player)
    redirect '/play'
  end

  get '/switch' do
    @game = $game
    @game.switch
    redirect @game.current_player.name == 'Computer' ? '/attack' : '/play'
  end

  get '/game_over' do
    @game = $game
    erb :game_over
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
