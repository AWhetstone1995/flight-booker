class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :flights, through: :booking, source: :flight
end
