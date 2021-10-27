class FlightsController < ApplicationController
  def index
    @airport_codes = Airport.all.map { |a| [a.code, a.id] }
    @years = (Flight.all.map { |f| [f.start.year] }).sort.uniq
    @months = (Flight.all.map { |f| [f.start.month] }).sort.uniq
    @days = (Flight.all.map { |f| [f.start.day] }).sort.uniq

    unless params[:year].blank? && params[:month].blank? && params[:day].blank?
      @selected_date = DateTime.civil(params[:year].to_i, params[:month].to_i, params[:day].to_i)
      @flights = Flight.where(departure_airport_id: params[:departure_airport_id],
                              arrival_airport_id: params[:arrival_airport_id],
                              start: @selected_date.all_day)
      p "Flights: #{@flights}"
    end
  end
end
