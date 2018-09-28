class ReservationMailer < ApplicationMailer
    def booking_email(reservation)
        @customer = reservation.user
        @host = reservation.listing.user
        @listing = reservation.listing

        mail(to: @customer.email, subject: "You've booked <%= @listing.name %>!")
        
    end
end
