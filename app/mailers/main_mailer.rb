class MainMailer < ApplicationMailer
  def participation_invite(player)
    @player = player
    Rails.logger.info "Trying to send email to #{@player.email}"

    # calculate next monday
    today = Date.today
    next_monday = today + ((1 - today.wday) % 7)
    @next_monday = next_monday.strftime('%d %B %Y')

    @url = url_for(controller: 'games', action: 'index', token: @player.token, only_path: false)
    Rails.logger.info "Generated URL for player #{@player.email}: #{@url}"
    mail(to: @player.email, subject: 'Réservation de parties de golf')
  end
end
