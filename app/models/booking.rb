class Booking < ApplicationRecord
  belongs_to :flight, foreign_key: :flight_id
  has_many :passengers, foreign_key: :passenger_id

  accepts_nested_attributes_for :passengers
end
