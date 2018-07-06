class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.boolean :status
      t.date :finish
      t.integer :players

      t.timestamps
    end
  end
end
