class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :artist_id
      t.integer :label_id
      t.integer :jenle_id
      t.string :title
      t.integer :price
      t.boolean :status
      t.text :jacket_image_id
      t.integer :stock
      t.timestamps
    end
  end
end
