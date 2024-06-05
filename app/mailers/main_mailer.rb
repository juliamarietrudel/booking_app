class MainMailer < ApplicationMailer
  def participation_invite(player)
    @player = player
    Rails.logger.info "Sending email to #{@player.email}"
    mail(to: @player.email, subject: 'Upcoming Games Participation')
    Rails.logger.info "Email sent to #{@player.email}"
  end
end
