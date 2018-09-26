class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :listing

    validates :booking_start, presence: true
    validates :booking_end, presence: true
    validate :check_overlap

    before_create :cal_total_price

    #calculate price
    def cal_total_price
        price = self.listing.price
        self.total_price = (self.booking_end - self.booking_start) * price
    end

    def check_overlap
        #compare (range_1).overlaps?(range_2)
        list = Reservation.where(listing_id: self.listing_id)
        byebug
        list.each do |check|
            not_available = check.booking_start..check.booking_end
            if (self.booking_start..self.booking_end).overlaps?not_available
                errors.add(:Property, "Not available on the selected date. Please select other date range.")
                break
            end
        end
    end
end
