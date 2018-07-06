class AddUserIdToWallets < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :user_id, :integer
  end
end
