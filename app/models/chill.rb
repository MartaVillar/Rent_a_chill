class Chill < ApplicationRecord
   belongs_to :user
   has_many :bookings, dependent: :destroy
   validates :title, :capacity, :price_per_hour, :location, presence: true
 end
