class Game < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations

  def participated?(player)
    participations.exists?(player_id: player.id)
  end

  def self.dates_for_next_week
    # start_date = Date.today.next_week(:sunday)
    start_date = Date.today + (7 - Date.today.wday) % 7
    (1..4).map { |i| start_date + i.days }
  end

  def self.create_games(dates)
    dates.map do |date|
      Game.create(date: date)
    end
  end

  # def self.find_or_create_date(date)
  #   find_or_create_by(date: date)
  # end

  scope :by_date, -> { order(:date) }
end
