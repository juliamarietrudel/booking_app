class ParticipationsController < ApplicationController
  before_action :set_player_and_game, except: [:index]

  # called by the form when user clicks on buttons
  def create_or_destroy
    @participation = Participation.find_by(player: @player, game: @game)
    Rails.logger.debug '********* CLICKED *********'

    if @participation
      destroy
      # flash[:notice] = "#{@player.name}, you just UNBOOKED #{@game.date}'s game"
    else
      create
      # flash[:alert] = "#{@player.name}, you just BOOKED #{@game.date}'s game"
    end
    redirect_to player_games_path(token: @player.token)
  end

  # called by js API to check if participation exists
  def participation_exists
    if Participation.exists?(player: @player, game: @game)
      render json: { exists: true }
    else
      render json: { exists: false }
    end
  end

  def index
    @participations = Participation.all
    @games = Game.by_date
  end

  private

  # find player and game based on token and id
  def set_player_and_game
    @player = Player.find_by(token: params[:token])
    @game = Game.find(params[:game_id])
  end

  # destroy existing participation record
  def destroy
    @participation.destroy
  end

  # create new participation record
  def create
    Participation.create(player: @player, game: @game)
  end

  def group_by_date(participations)
    participations.group_by do |participation|
      participation.date
    end
  end
end
