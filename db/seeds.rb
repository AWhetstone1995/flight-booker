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

# Helper methods to create random date and time
def rand_in_rang(from, to)
  rand * (to - from) + from
end

def rand_time(from, to=Time.now)
  Time.at(rand_in_rang(from.to_f, to.to_f))
end

# Seed database with flights
2000.times do
  Flight.create(departure_airport_id: Airport.ids.sample, arrival_airport_id: Airport.ids.sample, start: rand_time(30.days.from_now), flight_duration: rand(1..6))
end
