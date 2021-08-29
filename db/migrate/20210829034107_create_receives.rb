class CreateReceives < ActiveRecord::Migration[6.1]
  def change
    create_table :receives do |t|
      t.references :order, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
