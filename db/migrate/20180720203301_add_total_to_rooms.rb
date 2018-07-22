class AddTotalToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :total, :integer
  end
end
