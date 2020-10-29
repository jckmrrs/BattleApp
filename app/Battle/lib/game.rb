require_relative 'player'
class Game

  def initialize(player1, player2)
    @players = [player1, player2]
    @turn = @players[0]
  end

  def player_one
    @players.first
  end

  def player_two
    @players.last
  end

  def attack(player)
    player.hp -= 10
    change_turn
  end

  def change_turn
    @turn = show_opponent_turn
  end

  def show_turn
    @turn
  end

  def show_opponent_turn
    @players[((@players.index(@turn)-1)**2)]
  end

end
