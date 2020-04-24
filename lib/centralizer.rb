require 'io/console'

class Centralizer

  def initialize
    @SCREEN_SIZE = IO.console.winsize
    @screen_width =  @SCREEN_SIZE[1]
  end

  def centralize(str)
    pad_length = (((@screen_width - str.size) / 2) / 2 ) * 2
    padding = String.new(" " * pad_length)
    padding + str
    # str
  end

end