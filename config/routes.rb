Rails.application.routes.draw do
  root 'players#show'

  # choose games
  get 'games/players/:token', to: 'players#show', as: 'player_games'
  post 'confirm', to: 'participations#confirm', as: 'confirm_game'

  # endpoint to fetch game participation
  get 'games/:id/participations', to: 'games#participations', as: 'game_participations'
  post '/games/:id/participations', to: 'games#participations'
end
