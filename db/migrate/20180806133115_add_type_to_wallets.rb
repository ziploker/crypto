class AddTypeToWallets < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :trans_type, :string
  end
end
