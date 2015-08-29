require './lib/game'
require './lib/board'
require './lib/player'

module TicTacToe
  # game description
  # when you run this program from the command line,
  # it will display a new tic-tac-toe game board.
  # there will be a prompt for the 1st player to
  # enter the index # corresponding to the board.
  # index is like so:

  #    1 | 2 | 3
  #    ---------
  #    4 | 5 | 6
  #    ---------
  #    7 | 8 | 9

  # if the cell is empty and a valid index are inserted (1-9)
  # then place the players entry in the cell.
  # then check to see if that placement has completed a row, column or diagonal
  # if so, then game over.
  # else
  # present a prompt for player 2 and repeat process until either
  # 1. a player wins
  # 2. the board is full and no win (Draw)
  # 3. (is there a way to determine draw before board is full?
end
