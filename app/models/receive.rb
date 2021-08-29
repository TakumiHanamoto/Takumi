class Receive < ApplicationRecord
  belongs_to :order
  belongs_to :student
  validates_uniqueness_of :order_id, scope: :student_id
end
