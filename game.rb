require "./player"
require "./turn_manager"

# Game class
class Game
  # Setup players constructor
  def initialize
    player1 = Player.new "Player 1"
    player2 = Player.new "Player 2"

    @players = [player1, player2]
    @turn_manager = TurnManager.new @players
  end

  # Run game function
  def run
    while (not game_over?)
      turn = @turn_manager.next_turn
      if (turn.player.alive?)
        random_number_1 = random_number()
        random_number_2 = random_number()
        puts "----- NEW TURN -----"
        puts "#{turn.player.name}: What does #{random_number_1} plus #{random_number_2} equal?"
        if (random_number_1 + random_number_2 == gets.chomp.to_i)
          puts "#{turn.player.name}: YES! You are correct."
        else
          puts "#{turn.player.name}: Seriously? No!"
          turn.player.lose_life(1)
        end
          puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
      end

      # Show winner
      if (@players[1].lives == 0)
        puts "Player 1 wins with a score of #{@players[0].lives}/3"
      else
        puts "Player 2 wins with a score of #{@players[1].lives}/3"
      end
    end
  end

  private

  # Next turn function
  def next_turn
    @current_index = (@current_index + 1) % @players.count
  end

  # Pick first random number function
  def random_number
    rand(1..20)
  end
  
  # Players alive function
  def alive_players
    @players.select { |player| player.alive? }
  end
  
  # Game over function
  def game_over?
    alive_players.count == 1
  end
end