class AddTotalToWallets < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :total, :decimal
  end
end
