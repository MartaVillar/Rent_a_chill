class Chill < ApplicationRecord
  include PgSearch
   belongs_to :user
   geocoded_by :location
   after_validation :geocode, if: :will_save_change_to_location?
   has_many :bookings, dependent: :destroy
   mount_uploader :photo, PhotoUploader
   validates :title, :capacity, :price_per_hour, :location, presence: true
   pg_search_scope :search_by_title_description,
       against: [ :title, :description ],
       using: {
         tsearch: { prefix: true }
       }
 end
