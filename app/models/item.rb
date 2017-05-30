class Item < ApplicationRecord
  belongs_to :user
  validates :description, presence: true
  validates :price, presence: true
  mount_uploader :photo, PhotoUploader
end
