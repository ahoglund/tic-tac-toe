require 'rubygems'
require 'sinatra/base'
require_relative 'tic_tac_toe'
require 'json'
# configure :production do
#   # Configure stuff here you'll want to
#   # only be run at Heroku at boot

#   # TIP:  You can get you database information
#   #       from ENV['DATABASE_URI'] (see /env route below)
# end

class TicTacToeApp < Sinatra::Base
  enable :sessions

  before do
    @game = TicTacToe::Game.new
  end

  # Quick test
  get '/' do
    @turn           = @game.turn
    @current_player = @game.current_player
    erb :index
  end

  get '/move' do
    @turn = params[:turn].to_i + 1
    @current_player = @game.next_player(current_turn: @turn)
    content_type :json
    { :mark => @current_player.mark, :turn => @turn }.to_json
  end
end

TicTacToeApp.run!