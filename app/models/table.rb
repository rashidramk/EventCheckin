class Table < ActiveRecord::Base
  belongs_to :restaurant
  has_many :bookings
end
