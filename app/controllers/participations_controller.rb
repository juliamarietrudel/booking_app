class ParticipationsController < ApplicationController
  before_action :set_current_player

  def create
    @game = Game.find(params[:game_id])
    @participation = Participation.find_by(player: @player, game: @game)
    # Rails.logger.debug "********* #{@game.participated?(@player)} *********"

    if @participation
      destroy_participation
      redirect_to player_games_path(token: @player.token), notice: "#{@player.name}, you have unbooked #{@game.date}'s game."
    else
      flash_notice = create_participation
      redirect_to player_games_path(token: @player.token), notice: flash_notice
    end
  end

  private

  def set_current_player
    @player = Player.find_by(token: params[:token])
    Rails.logger.debug "PLAYER: #{Player.find_by(token: params[:token])}"
  end

  def destroy_participation
    @participation.destroy
    flash[:notice] = "#{@player.name}, you have unbooked #{@game.date}'s game"
  end

  def create_participation
    participation = Participation.create(player: @player, game: @game)
    if participation.save
      'Your participation has been confirmed.'
    else
      "Failed to create participation: #{participation.errors.full_messages.join(', ')}"
    end
  end
end
