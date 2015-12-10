require_relative 'player'
require 'forwardable'

class Game

  extend Forwardable

  def_delegator :player_1, :name, :player_1_name
  def_delegator :player_2, :name, :player_2_name
  def_delegator :player_2, :hit_points, :player_2_hit_points
  def_delegator :player_1, :hit_points, :player_1_hit_points

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = player_1
  end

  def current_player
    @current_player
  end

  def switch
    @current_player = other_player
  end

  def other_player
    @players.select { |x| x != @current_player }.first
  end

  def attack(player)
    player.receive_damage
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end
end
