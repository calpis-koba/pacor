class AddAToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :a, :integer
  end
end
