class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :listing

    validates :booking_start presence: true
    validates :booking_end presence: true
end
