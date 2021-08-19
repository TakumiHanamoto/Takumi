class Like < ApplicationRecord
  belongs_to :order
  belongs_to :requester

  validates_uniqueness_of :order_id, scope: :requester_id
end
