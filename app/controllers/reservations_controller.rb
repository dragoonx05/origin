class ReservationsController < ApplicationController

    def show
        @reservation = Reservation.where(user_id: current_user.id)
    end

    def new
        
    end

    def create
        @listing = Listing.find(params[:id])
        @reserve = Reservation.where(listing_id: params[:id])
        booking_date = #params
        return_date = #params
        if @reserve
            unless @reserve.booking_start == " " && @reserve.booking_end == " " 
                @reserve = Reserve.new(params)
            end
        end

    end

    def update
    end

    def delete
    end

end
