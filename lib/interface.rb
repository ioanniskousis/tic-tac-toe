class Interface
  def initialize
    @vertical = "\u2503"
    @horizontal = "\u2501"
    @cross = "\u254b"
    @cell_width = 11
    @cell_height = 5
  end

  def draw(arr)
    pads = @cell_height / 2
    array = [] << ''
    array << header_line(0, arr)
    (pads - 1).times { array << padding_line }
    array << check_line(0, arr)
    pads.times { array << padding_line }
    array << separator
    array << header_line(1, arr)
    (pads - 1).times { array << padding_line }
    array << check_line(1, arr)
    pads.times { array << padding_line }
    array << separator
    array << header_line(2, arr)
    (pads - 1).times { array << padding_line }
    array << check_line(2, arr)
    pads.times { array << padding_line }
    array << ''
    array
  end

  private

  def separator
    dashes = String.new(@horizontal * @cell_width)
    dashes + @cross + dashes + @cross + dashes
  end

  def header_line(line_num, arr)
    spaces = String.new(' ' * @cell_width)
    line = spaces + @vertical + spaces + @vertical + spaces
    line[0] = ((line_num * 3) + 1).to_s if arr[line_num * 3].zero?
    line[@cell_width + 1] = ((line_num * 3) + 2).to_s if arr[(line_num * 3) + 1].zero?
    line[(2 * @cell_width) + 2] = ((line_num * 3) + 3).to_s if arr[(line_num * 3) + 2].zero?
    line
  end

  def padding_line
    spaces = String.new(' ' * @cell_width)
    spaces + @vertical + spaces + @vertical + spaces
  end

  def check_line(line_num, arr)
    hsp = String.new(' ' * (@cell_width / 2).to_i)
    hspv = hsp + @vertical + hsp
    line = hsp + user_check(line_num * 3, arr) + hspv
    line += user_check((line_num * 3) + 1, arr) + hspv
    line += user_check((line_num * 3) + 2, arr) + hsp
    line
  end

  def user_check(arr_index, arr)
    return 'X' if arr[arr_index] == 1
    return 'O' if arr[arr_index] == 2

    ' '
  end
end
