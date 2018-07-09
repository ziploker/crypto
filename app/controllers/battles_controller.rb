class BattlesController < ApplicationController

	
def new
	
	
	
	
end		

def create
	
	if current_user	
		@battle = current_user.battles.build(battle_params)
		@battle.users << current_user
		
	
		puts "create it next "+@battle.inspect
		#@battle.users << @user
		if @battle.save
			redirect_to(battle_path(@battle))
		end
	else
		redirect_to(new_user_registration_path)

	end
	
	

end	

def index
	if current_user
		@user = current_user
	end
	@battle = Battle.all

end	

def show
	@user = current_user
	@battle = Battle.find(params[:id])

end

def update
	@user = current_user
	@battle = Battle.find(params[:id])
	@battle.users << @user
	@battle.update(battle_params)
	redirect_to(battle_path(@battle.id) )

end



private
	  def battle_params
	    params.require(:battle).permit(:status, :finish, :players)
	  end


end
