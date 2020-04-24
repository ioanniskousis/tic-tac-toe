class Interface
  def initialize

  end

  def create_line(line_num, arr)
    case line_num
    when 1, 3
      return '-+-+-'
    else 
      line = ' | | '
      arr_sub_index = line_num == 2 ? 1 : (line_num == 4 ? 2 : 0)
      line[0] = 'x' if arr[arr_sub_index * 3] == 1
      line[2] = 'x' if arr[(arr_sub_index * 3) + 1] == 1
      line[4] = 'x' if arr[(arr_sub_index * 3) + 2] == 1

      line[0] = 'O' if arr[arr_sub_index * 3] == 2
      line[2] = 'O' if arr[(arr_sub_index * 3) + 1] == 2
      line[4] = 'O' if arr[(arr_sub_index * 3) + 2] == 2
      return line
    end
  end

  def draw(arr)
    array = []
    5.times { |line| array << create_line(line, arr) }
    array
  end

end
