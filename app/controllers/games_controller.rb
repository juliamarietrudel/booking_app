class GamesController < ApplicationController
  def participations
    @game = Game.find(params[:id])
    @participations = @game.participations.includes(:player)

    respond_to do |format|
      format.json { render json: @participations }
    end
  end
end
