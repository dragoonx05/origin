class BookingEmailJob < ApplicationJob
  queue_as :default

  def perform(booking)
    ReservationMailer.booking_email(booking).deliver_now
    # Do something later
  end
end
