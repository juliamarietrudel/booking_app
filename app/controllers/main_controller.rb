class MainController < ApplicationController
  def index
    @day = Date.today.strftime('%A')
    @date = Date.today.strftime('%d')
    @month = Date.today.strftime('%B')
  end

  def send_participation_invites
    Rails.logger.info "=== send_participation_invites called ==="
    Player.find_each do |player|
      Rails.logger.info "=== Inviting player: #{player.email} ==="
      MainMailer.participation_invite(player).deliver_later
    end

    redirect_to root_path, notice: 'Participation invites sent to all players.'
  end
end
