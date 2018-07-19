class CreateJoinTableRoomsWallets < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rooms, :wallets, :id => false do |t|
      

      t.integer :room_id, null: false
      t.integer :wallet_id, null: false
    


      # t.index [:room_id, :wallet_id]
      # t.index [:wallet_id, :room_id]
    end
  end
end
