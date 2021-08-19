class AddRequesterIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :requester_id, :integer
  end
end
