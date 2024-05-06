class Player < ApplicationRecord
  before_create :generate_token
  has_many :participations
  has_many :games, through: :participations

  private

  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end
end
