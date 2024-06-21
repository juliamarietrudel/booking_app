class PlayersController < ApplicationController
  before_action :set_player
  def add_comment
    @player.comment = params[:comment]
    @player.save
  end

  private

  def set_player
    @player = Player.find_by(token: params[:token])
  end
end
