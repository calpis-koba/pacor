class AddJenleToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :jenle, :string
  end
end
