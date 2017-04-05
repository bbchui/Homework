class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

    take_turn until @game_over
    if @game_over
      game_over_message
      reset_game
    end
  end

  def take_turn
    show_sequence
    require_sequence

    if !@game_over
      round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system('clear')
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering first letter of each color"
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25

  end

  def add_random_color
    colors = %w(red blue yellow green)
    @seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "success!!"

  end

  def game_over_message
    puts "game over loser"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

s = Simon.new
s.play
