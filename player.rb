# Player class
class Player
  # Player as read-only
  attr_reader :name, :lives

  # Initialize player lives
  MAX_LIVES = 3

  # Player constructor
  def initialize name
    @name = name
    @lives = MAX_LIVES
  end

  # Player lose life function
  def lose_life amount
    @lives -= amount
  end

  # Player alive function
  def alive?
    @lives > 0
  end
end