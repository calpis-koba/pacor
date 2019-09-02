class AddPrefecturesToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :prefectures, :string
  end
end
