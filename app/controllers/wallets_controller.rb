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
    @totalPrice = 0
    @room = Room.find(params[:wallet][:room])
    puts "room id #{params[:wallet][:room]}"
    puts "room params =  #{@room.inspect}"

    @wallet = Wallet.create(wallet_params)
    @wallet.rooms << @room
      #render plain: params[:porfolio].inspect
      
    @paid = params[:wallet][:paid]
    

   
    

    @totalPrice = @paid.to_i * params[:wallet][:quantity].to_i
    puts @room.balance

    if @totalPrice <= 10000



    


      if @wallet.save
        session[:room] = @room.id
        redirect_to(wallets_path, data: "create")
      else
       
        @existingWallet = Wallet.where(abbr: params[:wallet][:abbr] )

        existingQuantity = @existingWallet[0].quantity.to_int
        newQuantity = params[:wallet][:quantity]

        puts "existingQuantity is "+existingQuantity.to_s 
        puts "newQuantity is "+newQuantity.to_s

        @totalQ = existingQuantity.to_i + newQuantity.to_i
       
        @existingWallet.update(quantity: @totalQ)

        #totalQuantity = existingQuantity + newQuantity
        #puts "new total quantity ="+totalQuantity

        puts "elsrfgsdfsdfsdfsdf"   


        redirect_to(wallets_path, data: "updatedededdit")
      end

    else
      puts "not enough"
    end
  end

  def edit
    @wallet = Wallet.find(params[:id])
  end

  def update
    @wallet = Wallet.find(params[:id])
 
      if @wallet.update(wallet_params)
        
        redirect_to(wallets_path, data: "wtffff")
    else
      render 'error'
    end
  end

  def delete
  end

  def destroy
  end

  def updateRoom
     @room = Room.find(params[:id]) 
     @room.total = (params[:total])
     if @room.save;
      puts "diddddddit";
    end

  end


  private
    def wallet_params
      params.require(:wallet).permit(:abbr, :name, :quantity, :paid, :current_value, :profit_loss, :url)
    end
end
