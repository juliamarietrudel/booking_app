require 'faker'

players = []

player = Player.create(
  first_name: 'Julia',
  last_name: 'Trudel',
  email: 'juliamarietrudel96@gmail.com',
  token: SecureRandom.urlsafe_base64
)
players << player

player = Player.create(
  first_name: 'Vincent',
  last_name: 'Trudel',
  email: 'trudelvincent@outlook.com',
  token: SecureRandom.urlsafe_base64
)
players << player

player = Player.create(
  first_name: 'Nathalie',
  last_name: 'Denault',
  email: 'natdenault@videotron.ca',
  token: SecureRandom.urlsafe_base64
)
players << player

player = Player.create(
  first_name: 'Aurelie',
  last_name: 'Trudel',
  email: 'aurelietrudel@gmail.com',
  token: SecureRandom.urlsafe_base64
)
players << player



puts "#{players.count} players added"
