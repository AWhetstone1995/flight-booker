class Passenger < ApplicationRecord
  has_many :flights, through: :booking, source: :flight
end
