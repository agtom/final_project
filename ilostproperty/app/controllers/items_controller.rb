class ItemsController < ApplicationController

	before_action :correct_user, only: :destroy

	def new
		@item = Item.new
	end

	def show
		@user = User.find(params[:user_id])
	  	@item = Item.find(params[:id])
	end

	def create
		#@user = current_user
		@item = current_user.items.build(item_params)
		if (@item.save)
      	flash[:success] = "Item Registered!"
      	redirect_to (current_user)
    	else
      	render 'new'
		end
	end

	def index
    @user = User.find(params[:user_id])
    @items = @user.items
    # @item = Item.new
    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
    end
    @new_item = @user.items.build
  end

	def edit
		@item = Item.find(params[:id])
	end

	def update
  	@item = Item.find(params[:id])
  	@item.update(item_params)
  	redirect_to(current_user)
  end

	 def destroy
	 	@item = Item.find(params[:id])
	 	@item.destroy
	 	flash[:success]="Item deleted"
  	redirect_to(current_user)
	 end

	  private 
	  	def item_params
	  		params.require(:item).permit(:name, :location_lost, :reward, :found)
	  	end

	    def correct_user
	      @item = current_user.items.find_by(id:params[:id])
	      redirect_to root_url if @item.nil?
	    end

end
