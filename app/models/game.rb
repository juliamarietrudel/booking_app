class Game < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations

  def participated?(player)
    participations.exists?(player_id: player.id)
  end
end
