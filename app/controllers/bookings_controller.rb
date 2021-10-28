class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @selected_flight = Flight.find(params[:f])
    @passenger_count = params[:passenger_count].to_i
    @passenger_count.times { @booking.passengers.new }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = 'Booking succesfully completed!'
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'An error occured!'
      render "new"
    end
  end

  def show

  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id, passengers_attributes: [:name, :email])
  end
end
