class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    @cups = Array.new(14) { [:stone,:stone,:stone,:stone] }
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    unless (0..5).include?(start_pos) || (7..12).include?(start_pos)
      raise "Invalid starting cup"
    end

    raise "Starting cup is empty" if @cups[start_pos].empty?

    true
  end

  def make_move(start_pos, current_player_name)
    # From the starting position
    num = @cups[start_pos].length
    @cups[start_pos] = []
    skip = (current_player_name == @name1) ? 13 : 6
    i = start_pos

    until num == 0
      i = (i+1)%14
      unless i == skip
        @cups[i] << :stone
        num -= 1
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    return :prompt if [6,13].include?(ending_cup_idx)
    (@cups[ending_cup_idx].length == 1) ? :switch : ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all? { |el| el.empty? } || @cups[7..12].all? { |el| el.empty? }
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    @cups[6].length > @cups[13].length ? @name1 : @name2
  end
end
