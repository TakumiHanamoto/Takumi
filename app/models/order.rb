class Order < ApplicationRecord
    belongs_to :requester
    has_many :likes, dependent: :destroy
    has_many :liked_requesters, through: :likes, source: :requester
    has_many :receives, dependent: :destroy
    has_many :received_students, through: :receives, source: :student
    mount_uploader :image, ImageUploader
end
