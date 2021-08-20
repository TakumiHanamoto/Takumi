class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }
  has_many :likes, dependent: :destroy
  has_many :liked_orders, through: :likes, source: :order

  def already_liked?(order)
    self.likes.exists?(order_id: order.id)
  end
end
