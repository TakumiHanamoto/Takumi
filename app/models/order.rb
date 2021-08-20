class Order < ApplicationRecord
    belongs_to :requester
    has_many :likes, dependent: :destroy
    has_many :liked_requesters, through: :likes, source: :requester
    mount_uploader :image, ImageUploader
end
