class BattleController < ApplicationController

	

#new
def starter
	
	@battle = current_user.battles.build
	@user = current_user.id
	
end		

def create
	@user = current_user
	@battle = @user.battles.build(battle_params)
	
	#@battle.users << @user
	@battle.save

end		



private
	  def battle_params
	    params.require(:battle).permit(:room_number, :status, :end_time, :players, :user_id_1, :user_id_2)
	  end


end
