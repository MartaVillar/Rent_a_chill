class Booking < ApplicationRecord
  belongs_to :chill
  belongs_to :user
  validates :date, presence: true
end
