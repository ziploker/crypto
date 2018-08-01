class AddTotalsToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :bank, :decimal
    add_column :rooms, :total, :decimal
    add_column :rooms, :enemy_invested, :decimal
    add_column :rooms, :enemy_bank, :decimal
    add_column :rooms, :enemy_total, :decimal
  end
end
