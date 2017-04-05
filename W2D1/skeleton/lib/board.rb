class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times do |x|
        cup << :stone
      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end


  def valid_move?(start_pos)
    if start_pos < 1 || start_pos > 13
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    idx = start_pos
    until stones.empty?
      idx += 1
      idx = 0 if idx > 13
      if idx == 6
        @cups[idx] << stones.pop if current_player_name == @name1
      elsif idx == 13
        @cups[idx] << stones.pop if current_player_name == @name2
      else
        @cups[idx] << stones.pop
      end
    end
    render
    next_turn(idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? {|el| el.empty?} ||
      @cups[7..12].all? {|el| el.empty?}
      true
    else
      false
    end
  end

  def winner
    if @cups[6] == @cups[13]
      :draw
    elsif @cups[6].count > @cups[13].count
      @name1
    else
      @name2
    end
  end
end
