class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { minimum: 20 }
end
