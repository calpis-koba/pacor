class AddJenreToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :jenre, :string
  end
end
