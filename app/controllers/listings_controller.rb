class ListingsController < ApplicationController

    def index
        @listing = Listing.all
    end

    def new
    end

    def show
        @listing = Listing.find(params[:id])
    end

    def create
        @listing = Listing.new(listing_params)
        @listing.user_id = current_user.id  
        @listing.save
        redirect_to listings_path
    end

    private
    def listing_params
        params.require(:listings).permit(:name, :description, :address, :price, :bed_room_type, :bed_room_num, :bed_type, :bed_num, :bathroom_type, :bathroom_num)
    end

end
