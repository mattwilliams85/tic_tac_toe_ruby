require './lib/spaces'
require './lib/game'

@new_game = Game.new
@blank = "\n"

def main_menu
  system 'clear'
  puts " [=====TIC-TAC-TOE======]"
  puts @blank
  puts " 2-PLAYER INTENSE ACTION "
  puts @blank
  puts "N > New Game"
  puts "Q > Quit"
  user_key = gets.chomp
  system 'clear'
  if user_key == 'n'
    puts 'Enter name of Player 1'
    @player1 = gets.chomp
    puts 'Enter name of Player 2'
    @player2 = gets.chomp
    loading_screen
    start_game
  elsif user_key == 'q'
    puts "Whatever..."
    sleep(1)
    exit
  else
    puts "That is not a valid input..."
    sleep(1)
    main_menu
  end
end

def start_game
  turn = 0
  @used_spaces = []

  loop do
    system 'clear'
    @new_game.print_board
    puts@blank
    if turn == 0
      puts "#{@player1}'s turn"
    else
      puts "#{@player2}'s turn"
    end
    puts@blank
    puts "Press 1-9 to select a square!"
    puts @blank
    key = gets.chomp.to_i
    if @used_spaces.include?(key)
      puts "That space has already been taken - press enter"
      gets.chomp
    elsif key >= 0 || key < 10
      @new_game.set_space(key,turn)
      @used_spaces << key
      turn ^= 1
      if @new_game.check
        if turn == 0
          system 'clear'
          @new_game.print_board
          puts @blank
          puts "#{@player1} WINS!!"
          puts "Press enter to continue"
          gets.chomp
          main_menu
        else
          system 'clear'
          @new_game.print_board
          puts @blank
          puts "#{@player2} WINS!!"
          puts "Press enter to continue"
          gets.chomp
          main_menu
        end
      end
    else
      puts "That is not a valid input!  - press enter"
      gets.chomp
    end
  end
end

def loading_screen
  5.times do
  system 'clear'
  print '\Loading'
  sleep(0.1)
  system 'clear'
  print "|Loading"
  sleep(0.1)
  system 'clear'
  print "/Loading"
  sleep(0.1)
  system 'clear'
  print "-Loading"
  sleep(0.1)
  system 'clear'
  end
end

main_menu
