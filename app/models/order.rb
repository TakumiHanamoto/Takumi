class Order < ApplicationRecord
    belongs_to :requester
    mount_uploader :image, ImageUploader
end
