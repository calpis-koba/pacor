class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total_price
      t.integer :payment
      t.integer :status
      t.string :postal_code
      t.string :address
      t.integer :delivery_cost
      t.timestamps
    end
  end
end
