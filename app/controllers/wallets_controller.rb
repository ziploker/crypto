class WalletsController < ApplicationController
  
  @roomNum = 0

  def index
    @roomnumber = session[:room]
    @room = Room.find(session[:room])
    @mywallet = @room.wallets
    
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
    @room = Room.find(params[:wallet][:room])
    puts "room id #{params[:wallet][:room]}"
    puts "room params =  #{@room.inspect}"

    @wallet = Wallet.create(wallet_params)
    @wallet.rooms << @room
      #render plain: params[:porfolio].inspect
      if @wallet.save
        session[:room] = @room.id
       redirect_to(wallets_path, data: "wtf")
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
        session[:room] = "wtf720"
        redirect_to(wallets_path, data: "wtffff")
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
