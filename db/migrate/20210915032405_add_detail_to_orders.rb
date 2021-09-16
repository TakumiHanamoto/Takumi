class AddDetailToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :place, :string
    add_column :orders, :datefrom, :datetime
    add_column :orders, :dateto, :datetime
    add_column :orders, :people, :integer
    add_column :orders, :job, :string
  end
end
