class ReservationsController < ApplicationController

    def show
        @reservation = Reservation.where(user_id: current_user.id)
    end

    def new
        
    end

    def create
        @listing = Listing.find(params[:listing_id])
        @reserve = Reservation.new(booking_params)
        @reserve.user_id = current_user.id
        @reserve.listing_id = @listing.id
        if @reserve.save == false
            redirect_to root_path
            flash[:error] = "Sorry, something went wrong."
        else
            redirect_to listing_path(@listing.id)
            flash[:success] = "You've successfully booked #{@listing.name}"
        end
    end

    def update
    end

    def delete
    end

    private
    def booking_params
        params.require(:reservation).permit(:booking_start, :booking_end, :user_id)
    end
end
