class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: :departure_airport_id
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: :arrival_airport_id

  validate :check_airport_ids

  private

  def check_airport_ids
    errors.add(:departure_airport_id) if departure_airport_id == arrival_airport_id
  end
end
