class User < ApplicationRecord

  after_create :send_welcome_email
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

  def name
    fullname
  end


  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
