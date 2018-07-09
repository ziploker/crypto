class WalletsController < ApplicationController
  def index
    #@mywallet = Wallet.all
    #@mywallet = Wallet.find(params[:user_id = @current])
    @current = current_user.id
    @wal = Wallet.where("user_id =?", current_user.id)
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def new
    @wallet = current_user.wallets.build
  end

  def create
    @wallet = current_user.wallets.build(wallet_params)
      #render plain: params[:porfolio].inspect
      if @wallet.save
        redirect_to(wallets_path)
    else
      render 'error'
    end
  end

  def edit
    @wallet = Wallet.find(params[:id])
  end

  def update
    @wallet = Wallet.find(params[:id])
 
      if @wallet.update(wallet_params)
        redirect_to '/porfolio'
    else
      render 'error'
    end
  end

  def delete
  end

  def destroy
  end



  private
    def wallet_params
      params.require(:wallet).permit(:abbr, :name, :quantity, :paid, :current_value, :profit_loss, :url)
    end
end
