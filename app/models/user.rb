class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  scope :orders, -> {order('created_at DESC')}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable

  validates :name, presence: true, length: {maximum: 50}
  validates :email, length: { in: 6..254 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
