class Game
  attr_reader :current_player
  attr_reader :error_message
  attr_reader :game_over
  attr_reader :winner
  attr_reader :grid

  def initialize
    @grid = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @current_player = 1
    @error_message = ''
    @game_over = false
    @winner = 0
  end

  def init
    @game_over = false
    @grid = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @winner = 0
  end

  def delete_error
    @error_message = ''
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

    @grid[cell - 1] = @current_player
    @winner = game_winner
    @game_over = true if @winner.positive?
    @game_over = true if @grid.none?(0)
    @current_player = @current_player == 1 ? 2 : 1
    true
  end

  def log
    arr = []
    @grid.each_with_index { |x, i| arr << i + 1 if x.positive? }
    arr
  end

  def available
    arr = []
    @grid.each_with_index { |x, i| arr << i + 1 if x.zero? }
    arr
  end

  private

  def game_winner
    row1 = []
    row2 = []
    row3 = []
    col1 = []
    col2 = []
    col3 = []
    dia1 = []
    dia2 = []
    row1 << @grid[0] << @grid[1] << @grid[2]
    row2 << @grid[3] << @grid[4] << @grid[5]
    row3 << @grid[6] << @grid[7] << @grid[8]
    col1 << @grid[0] << @grid[3] << @grid[6]
    col2 << @grid[1] << @grid[4] << @grid[7]
    col3 << @grid[2] << @grid[5] << @grid[8]
    dia1 << @grid[0] << @grid[4] << @grid[8]
    dia2 << @grid[2] << @grid[4] << @grid[6]
    all_sets = [] << row1 << row2 << row3 << col1 << col2 << col3 << dia1 << dia2
    return 1 if all_sets.any? { |set| set.all?(1) }

    return 2 if all_sets.any? { |set| set.all?(2) }

    0
  end
end
