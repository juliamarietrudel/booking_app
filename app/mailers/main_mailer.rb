class MainMailer < ApplicationMailer
  def participation_invite(player)
    @player = player
    mail(to: @player.email, subject: 'Upcoming Games Participation')
  end
end
