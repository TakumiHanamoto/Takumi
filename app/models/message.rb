class Message < ApplicationRecord
  belongs_to :requester
  belongs_to :student
  belongs_to :room
end
