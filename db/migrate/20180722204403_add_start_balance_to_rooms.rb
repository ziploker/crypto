class AddStartBalanceToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :balance, :integer
  end
end
