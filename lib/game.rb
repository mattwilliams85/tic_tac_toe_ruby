class Game
  attr :space, true
  def initialize
    @spaces = Spaces.new
    @space = @spaces.spaces
  end

  def check
    if @space[0] == @space[1] && @space[0] == @space [2]
      true
    elsif @space[3] == @space[4] && @space[3] == @space [5]
      true
    elsif @space[6] == @space[7] && @space[6] == @space [8]
      true
    elsif @space[2] == @space[5] && @space[2] == @space [8]
      true
    elsif @space[1] == @space[4] && @space[1] == @space [7]
      true
    elsif @space[0] == @space[3] && @space[0] == @space [6]
      true
    elsif @space[2] == @space[4] && @space[2] == @space [6]
      true
    elsif @space[0] == @space[4] && @space[0] == @space [8]
      true
    else
      false
    end
  end

  def set_space(key, turn)
    if turn == 0
      symbol = 'X'
    else
      symbol = 'O'
    end
    @space = @space.each_with_index {|s, index| if key == s then @space[index] = symbol end}
  end

  def print_board
    puts "GAME BOARD"

    puts @space[6].to_s + " | " + @space[7].to_s + " | " + @space[8].to_s
    puts "---------"
    puts @space[3].to_s + " | " + @space[4].to_s + " | " + @space[5].to_s
    puts "---------"
    puts @space[0].to_s + " | " + @space[1].to_s + " | " + @space[2].to_s

  end
end
