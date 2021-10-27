class Airport < ApplicationRecord
  has_many :departures, class_name: 'Flight'
  has_many :arrivals, class_name: 'Flight'

  validates :code, presence: true, uniqueness: true
end
