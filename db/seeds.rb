# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

codes = [
    "SFO",
    "NYC",
    "DFW",
    "LAX",
    "HOU",
    "ATL"
]

# Seed database with airports
codes.each do |code|
  Airport.create(code: code)
end

# Seed database with flights
20.times do
  Flight.create(departure_airport_id: Airport.ids.sample, arrival_airport_id: Airport.ids.sample, start: Date.today+rand(30), flight_duration: rand(6))
end
