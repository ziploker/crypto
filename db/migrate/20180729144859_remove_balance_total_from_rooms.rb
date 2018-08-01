class RemoveBalanceTotalFromRooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :balance, :integer
    remove_column :rooms, :total, :integer
  end
end
