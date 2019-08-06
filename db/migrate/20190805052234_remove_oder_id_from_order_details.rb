class RemoveOderIdFromOrderDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :oder_id, :integer
  end
end
