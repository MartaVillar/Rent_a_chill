class Booking < ApplicationRecord
  belongs_to :chill
  belongs_to :user
  validates :datetime, presence: true
end
