require 'faker'

games = []

games << Game.create(date: Date.parse('15.05.2024'))
games << Game.create(date: Date.parse('16.05.2024'))
games << Game.create(date: Date.parse('18.05.2024'))
games << Game.create(date: Date.parse('19.05.2024'))

puts 'four games were created'

players = []

10.times do
  player = Player.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    token: SecureRandom.urlsafe_base64
  )
  players << player
end

puts '10 players were created'
