class CreateJoinTableBattleUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :battles, :users do |t|
      # t.index [:battle_id, :user_id]
      # t.index [:user_id, :battle_id]
    end
  end
end
