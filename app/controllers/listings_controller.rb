class ListingsController < ApplicationController

    def index
        @listings = Listing.where(nil)

        @listings = @listings.price(params[:search][:price]) if params[:search] && params[:search][:price].present?
        @listings = @listings.bathroom_num(params[:search][:bathroom_num]) if params[:search] && params[:search][:bathroom_num].present?
        @listings = @listings.bathroom_type(params[:search][:bathroom_type]) if params[:search] && params[:search][:bathroom_type].present?
        @listings = @listings.page(params[:page]).per(10) #pagination only 
    end

    def new
        # authorization code
        # if user.customer?
        #     flash[:notice] = "Sorry. You are not allowed to perform this action."
        #     return redirect_to listing_path, notice: "Sorry. You do not have the permission to verify a property."
        # end
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
    
    def edit
        @listing = Listing.find(params[:id])
    end

    def update
        listing = Listing.find(params[:id])
        listing.update(listing_params)
        flash[:sucess] = "Successfully edited listing."
        redirect_to listing_path(listing)
    end

    def delete
        listing = Listing.find(params[:id])
        listing.destroy
        redirect_to listings_path
    end

    private
    def listing_params
        params.require(:listings).permit(:name, :description, :address, :price, :bed_room_type, :bed_room_num, :bed_type, :bed_num, :bathroom_type, :bathroom_num)
    end

end
