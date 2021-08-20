class AddDetailsToRequesters < ActiveRecord::Migration[6.1]
  def change
    add_column :requesters, :name, :string
    add_column :requesters, :profile, :text
  end
end
