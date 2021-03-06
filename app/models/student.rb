class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  has_many :orders, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_orders, through: :likes, source: :order
  has_many :rooms
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_orders, through: :favorites, source: :order

  def already_liked?(order)
    self.likes.exists?(order_id: order.id)
  end

  def already_favorited?(order)
    self.favorites.exists?(order_id: order.id)
  end
end
