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
	    params.require(:battle).permit(:status, :finish, :players)
	  end


end
