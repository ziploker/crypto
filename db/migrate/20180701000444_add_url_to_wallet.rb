class AddUrlToWallet < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :url, :string
  end
end
