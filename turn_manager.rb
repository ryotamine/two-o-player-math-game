# Turn manager class
class TurnManager
  # Player turn constructor
  def initialize players
    @players = players.dup
    @current_index = 0
  end

  # Next turn function
  def next_turn
    @current_index = (@current_index + 1) % @players.count
    Turn.new(@players[@current_index])
  end
end

class Turn
  attr_reader :player
  def initialize p
    @player = p
  end
end