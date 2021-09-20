class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :requester, foreign_key: true
      t.references :student, foreign_key: true
      t.text :content
      t.string :image
      t.references :messages, :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
