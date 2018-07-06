class HomeController < ApplicationController



def index

	if current_user
		@wallet = current_user.wallets.build
	else
		@wallet = Wallet.all
	end
	
end





private
	  def wallet_params
	    params.require(:wallet).permit(:abbr, :name, :quantity, :paid, :current_value, :profit_loss)
	  end










end
