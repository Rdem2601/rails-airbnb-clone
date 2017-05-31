class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :description, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end
