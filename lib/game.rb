class Game
  attr_reader :current_player, :error_message, :game_over, :winner, :grid

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
    row1 = prepare_row(0)
    row2 = prepare_row(1)
    row3 = prepare_row(2)

    col1 = prepare_column(0)
    col2 = prepare_column(1)
    col3 = prepare_column(2)

    dia1 = prepare_diagonal(1)
    dia2 = prepare_diagonal(2)

    all_sets = [] << row1 << row2 << row3 << col1 << col2 << col3 << dia1 << dia2
    return 1 if all_sets.any? { |set| set.all?(1) }
    return 2 if all_sets.any? { |set| set.all?(2) }

    0
  end

  def prepare_row(row_num)
    row = [] << @grid[row_num * 3] << @grid[(row_num * 3) + 1] << @grid[(row_num * 3) + 2]
    row
  end

  def prepare_column(col_num)
    col = [] << @grid[col_num] << @grid[col_num + 3] << @grid[col_num + 6]
    col
  end

  def prepare_diagonal(diag_num)
    diag = []
    if diag_num == 1
      diag << @grid[0] << @grid[4] << @grid[8]
    else
      diag << @grid[2] << @grid[4] << @grid[6]
    end
    diag
  end
end
