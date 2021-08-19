class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :order, null: false, foreign_key: true
      t.references :requester, null: false, foreign_key: true

      t.timestamps
    end
  end
end
