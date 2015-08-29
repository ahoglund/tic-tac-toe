module TicTacToe
  class Player 
    def initialize(name, mark)
      @name = name
      @mark = mark
    end

    attr_reader :name
    attr_reader :mark
  end
end