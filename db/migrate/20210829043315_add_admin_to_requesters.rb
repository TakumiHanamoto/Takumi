class AddAdminToRequesters < ActiveRecord::Migration[6.1]
  def change
    add_column :requesters, :admin, :boolean, default: false
  end
end
