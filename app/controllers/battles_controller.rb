class BattlesController < ApplicationController

	
def new
	
	@battle = Battle.new
end		


def create
	
	if user_signed_in?	
		
		puts battle_params.inspect
		@battle = current_user.battles.build(battle_params)
		@battle.users << current_user
		

		if @battle.save
			puts "saved!!"
			redirect_to(battle_path(@battle))
		end
	

else
		redirect_to(new_user_registration_path)
		puts "not "
	end
end	



def index
	if user_signed_in?
		@user = current_user
		@myBattles = @user.battles

	end
	
	
	@openBattles = Battle.where(players: 1)
	@battles = Battle.all
	@battle = Battle.new
	
end	




def show
	
	if Battle.where(id: params[:id]).exists?
	 	
	 	if user_signed_in?
			@user = current_user
			@battle = Battle.find(params[:id])
			
			#if flagger is true, user belongs to battle 
			#master_key = @user.battles.where(id: @battle.id )
		end
		@allUsers = User.all
	else
		
		redirect_to battles_path
	end
end



def update
	@user = current_user
	@battle = Battle.find(params[:id])
	flag = "off"
	puts "pre " + flag
	
	if user_signed_in?
		@battle.users.each do |u|
			if u.id == @user.id
				flag = "on"
				puts "if " + flag
			end
		end
		puts "else " + flag
		if flag == "off"
			@battle.update(battle_params)
			@battle.users << @user
			@battle.save
			redirect_to battle_path(@battle)
			puts "savit no dup"
		else
			puts "duplicate happeenning"
		end
		#@battle.update(battle_params)
		#redirect_to(battle_path(@battle.id) )
	else
		redirect_to new_user_registration_path
	end
end



private
	  def battle_params
	    params.require(:battle).permit(:status, :finish, :players, :total_players, :total)
	  end


end
