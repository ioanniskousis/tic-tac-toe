class Interface
  def initialize
    @left_padding = '     '
  end

  def draw(arr)
    array = [] << ''

    array << header_line(0, arr)
    array << check_line(0, arr)
    array << padding_line

    array << separator

    array << header_line(1, arr)
    array << check_line(1, arr)
    array << padding_line

    array << separator

    array << header_line(2, arr)
    array << check_line(2, arr)
    array << padding_line

    array << ''
    array
  end

  private

  def separator
    @left_padding + '-----+-----+-----'
  end

  def header_line(line_num, arr)
    line = '     |     |     '
    line[0] = ((line_num * 3) + 1).to_s if arr[line_num * 3].zero?
    line[6] = ((line_num * 3) + 2).to_s if arr[(line_num * 3) + 1].zero?
    line[12] = ((line_num * 3) + 3).to_s if arr[(line_num * 3) + 2].zero?
    @left_padding + line
  end

  def padding_line
    @left_padding + '     |     |     '
  end

  def check_line(line_num, arr)
    line = '  '
    line << user_check(line_num * 3, arr)
    line << '  |  '
    line << user_check((line_num * 3) + 1, arr)
    line << '  |  '
    line << user_check((line_num * 3) + 2, arr)
    @left_padding + line
  end

  def user_check(arr_index, arr)
    return 'x' if arr[arr_index] == 1
    return 'o' if arr[arr_index] == 2

    ' '
  end
end
