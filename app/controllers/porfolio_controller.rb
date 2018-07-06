class PorfolioController < ApplicationController


	#new (buy/sell holdings), use index instead
	def trade
		@wallet = current_user.wallets.build
	end

	
	#index  (list all holdinds), click to buy(create method)
	def myporfolio
		#@mywallet = Wallet.all
		#@mywallet = Wallet.find(params[:user_id = @current])
		@current = current_user.id
		@wal = Wallet.where("user_id =?", current_user.id)
	end

	
	#create
	def buy
		@wallet = current_user.wallets.build(porfolio_params)
  		#render plain: params[:porfolio].inspect
  		if @wallet.save
  			redirect_to '/porfolio'
		else
			render 'error'
		end
	end

	#show indivisual holding
	def show	
		@wallet = Wallet.find(params[:id])
	end

	#edit (edit holding)
	def edit
		@wallet = Wallet.find(params[:id])
	end

	def update
  		@wallet = Wallet.find(params[:id])
 
  		if @wallet.update(porfolio_params)
  			redirect_to '/porfolio'
		else
			render 'error'
		end
    		
  	end


	private
	  def porfolio_params
	    params.require(:wallet).permit(:abbr, :name, :quantity, :paid, :current_value, :profit_loss, :url)
	  end


end

