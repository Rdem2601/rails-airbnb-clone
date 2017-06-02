class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :items
  validates :fullname, presence: true
  validates :email, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end
