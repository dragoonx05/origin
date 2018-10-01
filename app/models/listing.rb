class Listing < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  include PgSearch
  multisearchable :against => [:name, :bathroom_type, :description, :bed_type]
  scope :price, -> (price) { where price: price }
  scope :bathroom_num, -> (bathroom_num) { where bathroom_num: bathroom_num}
  scope :bathroom_type, -> (bathroom_type) { where bathroom_type: bathroom_type }

end
