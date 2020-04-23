class Game
  
  attr_reader :current_player
  attr_reader :error_message
  attr_reader :game_over

  def initialize()
    @grid = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @current_player = 1
    @error_message = ""
    @game_over = false
  end

  def init
    @game_over = false
    @grid = [0, 0, 0, 0, 0, 0, 0, 0, 0]
  end

  def delete_error
    @error_message = ""
  end

  def check(cell)
    unless (1..9).include?(cell)
      @error_message = 'Wrong choice, play again!'
      return false
    end
    if @grid[cell - 1] != 0
      @error_message = 'Cell already checked!'
      return false
    end
    

    # Task 3 - Examine if the current status gives a winner

    @grid[cell - 1] = @current_player
    if @grid.none?(0)
      @game_over = true
    end
    
    @current_player = @current_player == 1 ? 2 : 1
    return true
  end

  def log
    arr = []
    @grid.each_with_index { |x, i| arr << i + 1 if x.positive?}
    arr
  end

  def available
    arr = []
    @grid.each_with_index { |x, i| arr << i + 1 if x == 0}
    arr
  end

end
