require 'rubygems'
require 'sinatra'
require './tic_tac_toe'

configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot

  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end



# Quick test
get '/' do
	@game = TicTacToe::Game.new
  erb :index
end