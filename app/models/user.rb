class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A((\w+)|(\.))+\@[a-z]+\.[a-z]{3}\z/ }
  validates :password_confirmation, presence: true
  validates :admin, inclusion: { in: [true, false] }

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    admin == true
  end
  has_many :reviews
end
