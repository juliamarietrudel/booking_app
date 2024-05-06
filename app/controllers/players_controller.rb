class PlayersController < ApplicationController
  before_action :set_current_player

  def show
    @games = Game.all.order(:date)
  end

  private

  def set_current_player
    @player = Player.find_by(token: params[:token])
  end
end
