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

  # display four games in email
  def register_participation
    if @player
      participation_date = begin
                            Date.parse(params[:date])
                          rescue ArgumentError
                            nil
                          end

      if participation_date
        # Ensures no duplicate participations
        created = Participation.find_or_create_by(player: @player, game_date: participation_date)
        if created
          @message = "Thank you for registering for the game on #{participation_date}."
        else
          @message = "You're already registered for the game on #{participation_date}."
        end
      else
        @message = 'Invalid date format.'
      end
    else
      @message = 'Invalid or expired token.'
    end

    # Render a view that displays the message
    render 'confirmation'
  end

  def send_participation_invites
    players = Player.all
    games = Game.all
    players.each do |player|
      GamesMailer.participation_invite(player, games).deliver_now
    end

    redirect_to root_path, notice: 'Participation invites sent to all players.'
  end

  private

  def set_current_player
    @player = Player.find_by(token: params[:token])
  end
end
