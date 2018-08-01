class BattlesController < ApplicationController

	
	def new
		
		@battle = Battle.new
	end		


	def create
		
		if user_signed_in?	
			
			puts battle_params.inspect
			@battle = current_user.battles.build(battle_params)
			@battle.users << current_user
			#@battle.rooms[0].balance = 10000
			

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
				@battle = Battle.find(params[:id])
				@uni = @battle
				@user = current_user

				if @battle.users.count >= 2
					
					@battle.users.each do |u|
						if u.id != @user.id
							@enemy = u
							@enemyRoom = Room.where(user_id: @enemy, battle_id: @battle.id)
							#session[:enemyroom] = @enemyRoom[0].id
						
							
						end
					end

				end
			end

			@flag = "false"

			
			@room = Room.where(user_id: current_user.id, battle_id: @battle.id)
			
			
			if @battle.users.count >= 2
				@battle.users.each do |u|
					
					if current_user.id == u.id 

						#session[:room] = @room[0].id

						
						@flag = "true"
					end
				end
			end
			
			if @enemyroom != nil


				
			end
			
			#if flagger is true, user belongs to battle 
			#master_key = @user.battles.where(id: @battle.id )

			
			@allUsers = User.all


			################## copy from wallets#index ###############




			@totals = 0
		    @times = 0
		    @theTotal = 
		    @names = []
		    @enemynombres = []
		    
		    #set session variables
		    @roomnumber = @room[0].id
		    @enemyroomnumber = @enemyRoom[0].id
		    
		    #set room for both players
		    ##@room = Room.find(@roomnumber)
		    @enemyroom = Room.find(@enemyroomnumber)
		    
		    #set enemy user object
		    ##enemy = User.where(id: @enemyroom.user_id)
		    ##@enemy = enemy[0]
		    
		    #set wallets
		    @mywallet = @room[0].wallets
		    @enemywallet = @enemyroom.wallets
		   
		    #get all names in wallet then remove duplicates
		    @mywallet.each do |record|
		      @names.push(record.name)
		    end
		    
		    @enemywallet.each do |r|
		      @enemynombres.push(r.name)
		    end
		    
		    #remove duplicates
		    @names = @names.uniq
		    @enemynombres = @enemynombres.uniq

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
				#S@battle.rooms[1].ballance = 100000

				#@room = Room.where(battle_id: params[:id], user_id: current_user.id)
				puts @room.inspect

				
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
