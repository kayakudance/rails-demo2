class User < ApplicationRecord
  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  scope :orders, -> {order('created_at DESC')}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable

  validates :name, presence: true
  validates :email, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
