Rails.application.routes.draw do
  # display games
  get 'players/:token/games', to: 'games#index', as: 'player_games'

  # create a participation with token and game_id
  post 'players/:token/games/:game_id/participations', to: 'participations#create_or_destroy', as: 'create_or_destroy_participation'

  # check if a participation exists
  get 'players/:token/games/:game_id/participation_exists', to: 'participations#participation_exists', as: 'participation_exists'

  # display all participations
  get 'participations', to: 'participations#index', as: 'all_participations'
end

































# choose games
# get 'games/players/:token', to: 'players#show', as: 'player_games'
# post 'confirm', to: 'participations#confirm', as: 'confirm_game'

# # endpoint to fetch game participation
# get 'games/:id/participations', to: 'games#participations', as: 'game_participations'
# post '/games/:id/participations', to: 'games#participations'
