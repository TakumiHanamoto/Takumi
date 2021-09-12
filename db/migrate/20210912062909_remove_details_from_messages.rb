class RemoveDetailsFromMessages < ActiveRecord::Migration[6.1]
  def change
    remove_reference :messages, :student, null: false, foreign_key: true
    remove_reference :messages, :requester, null: false, foreign_key: true
  end
end
