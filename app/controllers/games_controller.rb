class GamesController < ApplicationController
  before_action :set_current_player

  def index
    @games = Game.all
  end

  def participations
    @game = Game.find(params[:id])
    @player = Player.find(params[:token])
    # @participations = @game.participations.includes(:player)

    if request.post?
      participation = Participation.find_by(game: @game, player: @player)
      if participation
        participation.destroy
        message = 'Participation removed'
      else
        @game.participations.create(player: @player)
      end
      render json: { status: 'success', message: message }
    else
      render json: @game.participations
    end


    respond_to do |format|
      format.json { render json: @participations }
    end
  end

  private

  def set_current_player
    @player = Player.find_by(token: params[:token])
  end
end
