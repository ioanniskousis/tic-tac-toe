class Interface
  def initialize
    @VERTICAL = "\u2503"
    @HORIZONTAL = "\u2501"
    @CROSS = "\u254b"
    @CELL_WIDTH = 11
    @CELL_HEIGHT = 5
    @left_padding = '     '
  end

  def draw(arr)
    pads = @CELL_HEIGHT / 2
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
    dashes = String.new(@HORIZONTAL * @CELL_WIDTH)
    @left_padding + dashes + @CROSS + dashes + @CROSS + dashes
  end

  def header_line(line_num, arr)
    spaces = String.new(" " * @CELL_WIDTH)
    line = spaces + @VERTICAL + spaces + @VERTICAL + spaces
    line[0] = ((line_num * 3) + 1).to_s if arr[line_num * 3].zero?
    line[@CELL_WIDTH + 1] = ((line_num * 3) + 2).to_s if arr[(line_num * 3) + 1].zero?
    line[(2 * @CELL_WIDTH) + 2] = ((line_num * 3) + 3).to_s if arr[(line_num * 3) + 2].zero?
    @left_padding + line
  end

  def padding_line
    spaces = String.new(" " * @CELL_WIDTH)
    @left_padding + spaces + @VERTICAL + spaces + @VERTICAL + spaces
  end

  def check_line(line_num, arr)
    hsp = String.new(' ' * (@CELL_WIDTH / 2))
    hsp_v = hsp + @VERTICAL + hsp  
    line = hsp
    line << user_check(line_num * 3, arr)
    line << hsp_v 
    line << user_check((line_num * 3) + 1, arr)
    line << hsp_v 
    line << user_check((line_num * 3) + 2, arr)
    @left_padding + line
  end

  def user_check(arr_index, arr)
    return 'X' if arr[arr_index] == 1
    return 'O' if arr[arr_index] == 2

    ' '
  end
end
