Rails.application.routes.draw do
  root 'players#show'

  # choose games
  # get 'games/players/:token', to: 'players#show', as: 'player_games'
  # post 'confirm', to: 'participations#confirm', as: 'confirm_game'

  # # endpoint to fetch game participation
  # get 'games/:id/participations', to: 'games#participations', as: 'game_participations'
  # post '/games/:id/participations', to: 'games#participations'

    get 'players/:player_token/games', to: 'games#index', as: 'player_games'

    post 'players/:player_token/games/:game_id/participations', to: 'participations#create', as: 'create_participation'
    delete 'players/:player_token/games/:game_id/participations', to: 'participations#destroy', as: 'destroy_participation'
end
