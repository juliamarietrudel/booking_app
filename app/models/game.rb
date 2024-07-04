class Game < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations

  TOURNAMENT_DATES = [
    Date.new(2024, 8, 5),
    Date.new(2024, 8, 15),
    Date.new(2024, 8, 22),
    Date.new(2024, 9, 9),
    Date.new(2024, 9, 16),
    Date.new(2024, 9, 23)
  ].freeze

  def participated?(player)
    participations.exists?(player_id: player.id)
  end

  def self.create_games_for_the_week
    Rails.logger.info "Creating games for this week at #{Time.now}"
    dates = self.dates_for_next_week
    games = self.create_games(dates)
    Rails.logger.info "Games created: #{games.map(&:date).join(', ')}"
  end

  def self.dates_for_next_week
    # start_date = Date.today.next_week(:sunday)
    start_date = Date.today + (7 - Date.today.wday) % 7
    days_of_the_week = [1, 2, 4, 5]
    selected_days = days_of_the_week.map { |i| start_date + i.days }

    # exclude tournaments
    selected_days.reject { |date| TOURNAMENT_DATES.include?(date) }
  end

  def self.create_games(dates)
    dates.map do |date|
      Game.find_or_create_by(date:)
    end
  end

  # def self.find_or_create_date(date)
  #   find_or_create_by(date: date)
  # end

  scope :by_date, -> { order(:date) }

  scope :latest_week_games, lambda {
    latest_date = maximum(:date)
    where(date: latest_date.beginning_of_week..latest_date.end_of_week)
  }
end
