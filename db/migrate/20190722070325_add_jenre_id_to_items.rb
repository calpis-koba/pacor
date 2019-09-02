class AddJenreIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :jenre_id, :integer
  end
end
