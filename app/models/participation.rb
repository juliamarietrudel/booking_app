class Participation < ApplicationRecord
  belongs_to :player
  belongs_to :game

  scope :by_game_date, -> { order(:game_id) }
end
