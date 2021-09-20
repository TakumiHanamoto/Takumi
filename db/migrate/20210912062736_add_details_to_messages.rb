class AddDetailsToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :is_student, :boolean
    add_column :messages, :is_requester, :boolean
  end
end
