class AddTotalPlayersToBattles < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :total_players, :integer
  end
end
