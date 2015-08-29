require 'rubygems'
require 'sinatra'
require './tic_tac_toe'

configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot

  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

enable :sessions

# Quick test
get '/' do
  @game = TicTacToe::Game.new
  session[:player] = @game.current_player
  @current_player = session[:player]
  erb :index
end

get '/game/new' do 
  @game = TicTacToe::Game.new
  session[:player] = @game.current_player
end

get '/move/:player' do
  session[:player] = params[:player]
end