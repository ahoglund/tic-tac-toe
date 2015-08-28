module TicTacToe
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
end