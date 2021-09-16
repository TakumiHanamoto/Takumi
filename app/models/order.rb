class Order < ApplicationRecord
    belongs_to :requester
    has_many :likes, dependent: :destroy
    has_many :liked_requesters, through: :likes, source: :requester
    has_many :favorites, dependent: :destroy
    has_many :favorited_students, through: :favorites, source: :student
    mount_uploader :image, ImageUploader
end
