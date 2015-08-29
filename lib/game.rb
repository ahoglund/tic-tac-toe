module TicTacToe
  class Game

    def initialize
      @turn          = 0
      @board         = TicTacToe::Board.new
      @player_one    = TicTacToe::Player.new("First", "X")
      @player_two    = TicTacToe::Player.new("Second","O")
    end

    def current_player
      @turn % 2 == 0 ? @player_one : @player_two
    end

    def start
      while @turn <= 9

        if is_a_draw?
          reset_game
        end

        play
      end
    end
def name
  'Tic Tac Toe'
end
    private

    def play(move: 1)
      if @board.check_move(move, current_player.mark)
        @board.place_move(move, current_player.mark)
        if @board.check_for_win(current_player.mark)
          reset_game
        else
          @turn += 1
        end
      else
        # "Invalid Entry! (must be 1-9 and not taken already)\n"
      end
    end

    def reset_game
      TicTacToe.new_game if play_again?(gets)
    end

    def is_a_draw?
      @turn == 9 && ! @board.check_for_win(current_player.mark)
    end

    def play_again?(input)
      if input.strip =~ /Y/
        return true
      elsif input.strip =~ /N/
        return false
      end
    end
  end
end
  