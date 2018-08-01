class ChangeTotalToBeADecimalInWallets < ActiveRecord::Migration[5.2]
  def up

  	change_column :rooms, :total, :decimal
  end

  def down

  	change_column :rooms, :total, :integer
  end
end
