class AddTotalInvestedToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :invested, :decimal
  end
end
