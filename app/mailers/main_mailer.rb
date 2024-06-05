class MainMailer < ApplicationMailer
  def participation_invite(player)
    @player = player
    Rails.logger.info "Trying to send email to #{@player.email}"
    @url = url_for(controller: 'games', action: 'index', token: @player.token, only_path: false)
    Rails.logger.info "Generated URL for player #{@player.email}: #{@url}"
    mail(to: @player.email, subject: 'Upcoming Games Participation')
    Rails.logger.info "Email sent to #{@player.email}"
  end
end
