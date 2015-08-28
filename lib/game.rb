module TicTacToe
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
          # puts "Draw"
          #@board.draw
          reset_game
        end

        # game play
        #@board.draw
        play
      end
    end

    private

    def play(move: 1)
      # print "#{current_player[:name]} PlPayer's Move: "
      # move = gets
      if @board.check_move(move, current_player[:mark])
        @board.place_move(move, current_player[:mark])
        # check for winning move
        if @board.check_for_win(current_player[:mark])
          # puts "#{current_player[:name]} Player Wins!"
         # @board.draw
          reset_game
        else
          increment_turn
        end

      else
        # print "Invalid Entry! (must be 1-9 and not taken already)\n"
      end
    end

    def reset_game
      # print "Play Again? (Y|N) "
      if play_again?(gets)
        TicTacToe.new_game
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
  