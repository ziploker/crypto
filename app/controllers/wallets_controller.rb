class WalletsController < ApplicationController
  
  @roomNum = 0

  def index
    @totals = 0
    @times = 0
    @theTotal = 0
    @roomnumber = session[:room]
    @room = Room.find(session[:room])
    @mywallet = @room.wallets
    


    
    @current = current_user.id
    @wal = Wallet.where("user_id =?", current_user.id)


    @names = []

    @mywallet.each do |record|

      @names.push(record.name)

    end
    
    @names = @names.uniq
  end

  def show
    @wallet = Wallet.find(params[:id])
  end

  def new
    @wallet = current_user.wallets.build
  end

  def create
    
    @room = Room.find(params[:wallet][:room])
   
    @wallet = Wallet.create(wallet_params)
    @wallet.rooms << @room
    #render plain: params[:porfolio].inspect
      
    paid = params[:wallet][:paid]
    quantity = params[:wallet][:quantity]
    
    totalPrice = paid.to_i * quantity.to_i

    
    if totalPrice <= @room.balance
      
      newBalance = @room.balance - totalPrice
      @room.balance = newBalance
      @room.save

      
      if @wallet.save
        session[:room] = @room.id
        redirect_to(wallets_path, data: "updatedededdit")
      else
       
        

      
       

        

       
       
        


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

    @cv = params[:current_value]
 
      if @wallet.update(current_value: [:wallet][params[:current_value].to_i])
        
        puts "saved them all"
    else
      render 'error'
    end
  end

  def delete
  end

  def destroy
  end

  def updateRoom
    @room = Room.find(params[:wallet][:room])
   
    paid = params[:wallet][:paid]
    quantity = params[:wallet][:quantity]
    
    totalPrice = paid.to_i * quantity.to_i
     
    if totalPrice <= @room.balance
      
      newBalance = @room.balance - totalPrice
      @room.balance = newBalance
      @room.save

      
      if @wallet.save
        session[:room] = @room.id
        redirect_to(wallets_path, data: "updatedededdit")
      else
       
        

      
       

        

       
       
        


        redirect_to(wallets_path, data: "updatedededdit")
      end
    end
  end


  private
    def wallet_params
      params.require(:wallet).permit(:abbr, :name, :quantity, :paid, :current_value, :profit_loss, :url, :balance, :total)
    end
end
