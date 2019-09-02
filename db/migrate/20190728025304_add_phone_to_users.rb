class AddPhoneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string, default: ""
    add_column :users, :postal_code, :string, default: ""
    add_column :users, :address, :string, default: ""
  end
end
