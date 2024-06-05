require 'faker'

games = []

games << Game.create(date: Date.parse('10.06.2024'))
games << Game.create(date: Date.parse('11.06.2024'))
games << Game.create(date: Date.parse('12.06.2024'))
games << Game.create(date: Date.parse('13.06.2024'))

puts 'four games were created'

players = []

player = Player.create(
  name: 'Julia Trudel',
  email: 'juliamarietrudel96@gmail.com',
  token: SecureRandom.urlsafe_base64
)
players << player

player = Player.create(
  name: 'Charles Desjardins',
  email: 'desjardins.charles.a@gmail.com',
  token: SecureRandom.urlsafe_base64
)
players << player

puts '10 players were created'
