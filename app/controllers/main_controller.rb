class MainController < ApplicationController
  def index
    @day = I18n.l(Date.today, format: '%A')
    @date = I18n.l(Date.today, format: '%d')
    @month = I18n.l(Date.today, format: '%B')

    @player_count = Player.count
  end

  def send_participation_invites
    players = Player.all
    Rails.logger.info "Retrieved #{players.count} players for email invites"

    players.each do |player|
      Rails.logger.info "=== Inviting player: #{player.email} ==="
      MainMailer.participation_invite(player).deliver_later
    end

    redirect_to root_path, notice: 'Participation invites sent to all players.'
  end
end
