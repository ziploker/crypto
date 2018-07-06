class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.string :abbr
      t.string :name
      t.decimal :quantity
      t.decimal :paid
      t.decimal :current_value
      t.decimal :profit_loss

      t.timestamps
    end
  end
end
