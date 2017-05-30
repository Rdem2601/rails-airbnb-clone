class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :date, presence: true
  validates :number_of_days, presence: true
end
