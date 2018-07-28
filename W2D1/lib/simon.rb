class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    puts seq.join(", ")
    sleep 2
    system("clear")
  end

  def require_sequence
    print "Enter the sequence: "
    sequence = gets.chomp
    self.game_over = sequence.split(",").map(&:strip) != seq
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Nice! Starting next sequence."
    sleep 1
    system("clear")
  end

  def game_over_message
    puts "Game Over"
    puts "The correct sequence was #{seq.join(", ")}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

if __FILE__ == $0
  simon = Simon.new
  simon.play
end
