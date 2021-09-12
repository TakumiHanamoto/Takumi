class AddDetailsToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :room, null: false, foreign_key: true
    add_column :messages, :is_student, :boolean
  end
end
