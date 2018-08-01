class WalletsController < ApplicationController
  
  @roomNum = 0

  def index
    #set calculation variables
    @totals = 0
    @times = 0
    @theTotal = 
    @names = []
    @enemynombres = []
    
    #set session variables
    @roomnumber = session[:room]
    @enemyroomnumber = session[:enemyroom]
    
    #set room for both players
    @room = Room.find(@roomnumber)
    @enemyroom = Room.find(@enemyroomnumber)
    
    #set enemy user object
    enemy = User.where(id: @enemyroom.user_id)
    @enemy = enemy[0]
    
    #set wallets
    @mywallet = @room.wallets
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

  
  def show
    @wallet = Wallet.find(params[:id])
  end

  
  def new
    @wallet = current_user.wallets.build
  end

  
  def create
    
    #get room object
    @room = Room.find(params[:wallet][:room])
    
    #check if there is enuff funds
    paid = params[:wallet][:paid]
    quantity = params[:wallet][:quantity]
    totalPrice = BigDecimal(paid) * BigDecimal(quantity)
    
    if totalPrice <= @room.bank
      @room.bank -= totalPrice
      

      

      
      @wallet = Wallet.create(wallet_params)
      @wallet.rooms << @room
      

      @room.save
      

      
      if @wallet.save
        session[:room] = @room.id
        redirect_to(wallets_path)
      else
       
        redirect_to(wallets_path)
      
      end

    else
      render "need more money.html.erb"
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

  #room path to update room
  def updateRoom
    @room = Room.find(params[:id])
    @battle = Battle.where(id: @room.battle_id)
    @user = current_user
   
    #paid = params[:wallet][:paid]
    #quantity = params[:wallet][:quantity]
    
    #totalPrice = paid.to_i * quantity.to_i
     
    #if totalPrice <= @room.bank
    
    if params[:invested]
      @room.invested = BigDecimal(params[:invested])
      @room.total = @room.bank + @room.invested
    end

    if params[:enemy_invested]
      
      @battle[0].users.each do |u|
        if u.id != @user.id
          @enemy = u
          @enemyRoom = Room.where(user_id: @enemy, battle_id: @battle[0].id)
        end
      end

      
      @room.enemy_invested = BigDecimal(params[:enemy_invested])
      @room.enemy_bank = @enemyRoom[0].bank
      @room.enemy_total = @room.enemy_bank + @room.enemy_invested
      
    end

      #newBalance = @room.balance - totalPrice
      
      

      


      
      

      
      if @room.save
        #session[:room] = @room.id
        #redirect_to(wallets_path, data: "updatedededdit")
        puts "okokokokokokokokokokokoko"
      end
       
        

      
       

        

       
       
        


        
    
  end


  private
    def wallet_params
      params.require(:wallet).permit(:abbr, :name, :quantity, :paid, :current_value, :profit_loss, :url, :bank, :total, :invested, :enemy_bank, :enemy_invested, :enemy_total)
    end
end
