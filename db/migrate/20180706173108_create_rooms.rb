class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|

    	t.belongs_to :user, index: true
    	t.belongs_to :battle, index: true
    	t.datetime :room_winner
    	t.datetime :room_finish


    	t.timestamps
    end
  end
end
