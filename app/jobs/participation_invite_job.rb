class ParticipationInviteJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    player = job.arguments.first
    Rails.logger.info "************************************************************************************Email successfully sent to #{player.email}"
  end

  def perform(player)
    MainMailer.participation_invite(player).deliver_now
  end
end
