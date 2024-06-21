Rails.application.routes.draw do
  resources :users

  # display button
  root 'main#index'

  # send email to players
  post 'main/send_email', to: 'main#send_email', as: 'send_email_main'

  # display games for a given player
  get 'players/:token/games', to: 'games#index', as: 'player_games'

  # create or destroy a participation with token and game_id
  post 'players/:token/games/:game_id/participations', to: 'participations#create_or_destroy', as: 'create_or_destroy_participation'

  # check if a participation exists
  get 'players/:token/games/:game_id/participation_exists', to: 'participations#participation_exists', as: 'participation_exists'

  # display all participations
  get 'participations', to: 'participations#index', as: 'all_participations'

  # display four games in email
  get '/play', to: 'games#register_participation', as: 'register_game'

  post 'send_participation_invites', to: 'main#send_participation_invites'

  post 'add_comment', to: 'players#add_comment', as: 'add_comment'
end
