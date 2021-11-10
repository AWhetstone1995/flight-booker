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
      PassengerMailer.with(id: @booking.id).thank_you_email.deliver_now
      redirect_to booking_path(@booking)
    else
      flash[:alert] = 'An error occured!'
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id, passengers_attributes: [:name, :email])
  end
end
