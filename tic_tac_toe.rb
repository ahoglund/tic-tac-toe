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

  # class Player
  #   def initialize
  #   end
  # end

  class Board

    def initialize
      # create a finite set of cells, and default their 'mark' to the a #.
      # later in the program the integer'ness of a cell is used to determine if its
      # take or not.  In other words, if a cell contains an integer as its 'mark' then
      # its free to be populated with a user entry.
      @cells          = (1..9).collect { |i| { mark: i } }
      
      # since its a pretty small list, just hardcoding the possible
      # win combinations.  If for some reason this game were to be expanded to more rows/colums
      # then actual logic would need to be implemented here.
      @winning_ranges = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    end

    def draw
      print "\n"
      @cells.each_with_index { |e,i| print (i + 1) % 3 == 0 ? "#{e[:mark]} \n"  : "#{e[:mark]} | " }
      print "\n"
    end

    # check the range and also
    # check that the mark for the chosen cell 
    # is an integer (which means its not taken)
    def check_move(move, mark)
      move.to_i.between?(1,9) && @cells[move.to_i - 1][:mark].is_a?(Integer)
    end

    def place_move(move, mark)
      @cells[move.to_i - 1][:mark] = mark 
    end

    def check_for_win(mark)
      won = false
      @winning_ranges.each do |winning_range|
        win = 0
        winning_range.each { |r| win += 1 if @cells[r][:mark] == mark }
        won = true if win == 3
      end
      return won
    end
  end

  class Game

    def initialize
      @turn       = 0
      @board      = TicTacToe::Board.new
      @players    = [{name: "First", mark: "X"}, {name: "Second", mark: "O"}]
    end

    def start
      while @turn <= 9

        # determine draw
        if is_a_draw?
          puts "Draw"
          @board.draw
          reset
        end

        # game play
        @board.draw
        play
      end
    end

    private

    def play
      print "#{current_player[:name]} PlPayer's Move: "
      move = gets
      if @board.check_move(move, current_player[:mark])
        @board.place_move(move, current_player[:mark])
        # check for winning move
        if @board.check_for_win(current_player[:mark])
          puts "#{current_player[:name]} Player Wins!"
          @board.draw
          reset
        else
          increment_turn
        end

      else
        print "Invalid Entry! (must be 1-9 and not taken already)\n"
      end
    end

    def reset
      print "Play Again? (Y|N) "
      if play_again?(gets)
        TicTacToe::Game.new.start 
      else
        exit
      end
    end

    def increment_turn
      @turn += 1
    end

    def is_a_draw?
      @turn == 9 && ! @board.check_for_win(current_player[:mark])
    end

    def play_again?(input)
      if input.strip =~ /Y/
        return true
      elsif input.strip =~ /N/
        return false
      end
    end

    def current_player
      @turn % 2 == 0 ? @players[0] : @players[1]
    end
  end
end

TicTacToe::Game.new.start
