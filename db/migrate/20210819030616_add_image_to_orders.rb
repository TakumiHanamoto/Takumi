class AddImageToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :image, :string
  end
end
