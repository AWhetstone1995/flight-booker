class PassengerMailer < ApplicationMailer
  default from: 'notification@example.com'

  def thank_you_email
    @booking = Booking.find(params[:id])
    mail(to: @booking.passengers.pluck(:email), subject: "Booking Confirmation")
  end
end
