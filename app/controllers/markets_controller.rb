class MarketsController < ApplicationController

	def index

	if user_signed_in?
		@room = Room.find(session[:room])
		@authUserId = @room.user_id
		if @authUserId == current_user.id
			@pass = "go"
		

		else
			@pass = "stop"

		end
		@wallet = Wallet.new
	
	else
		@wallet = Wallet.all
	end
	
end





private
	  def wallet_params
	    params.require(:wallet).permit(:abbr, :name, :quantity, :paid, :current_value, :profit_loss)
	  end
end
