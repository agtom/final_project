class UsersController < ApplicationController
  
  def new
    @user = User.new
    @item = @user.items.new
  end

  def show
  	@user = User.find(params[:id])
    @items = @user.items
    @new_item = Item.new
    #@item = Item.new

    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
      marker.lat item.latitude
      marker.lng item.longitude
    end
  end

  def create
  	# create a method that gives user_params to avoid forbidden attributes errors
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
      # flash tells rails that data should only persist for one request
      flash[:success] = "Welcome to iLostProperty"
      # convention is to re-direct on successful signup (rather than render a create template)
      #  rails infers @user is user_url(@user)
  		redirect_to @user
  	else
  		# re-renders new.html.erb
  		# rails fills non-password entries with params from failed attempt at sign up
  		render 'new'
  	end
  end

	private
  #  technique is called strong parameters
	def user_params
		# params hash must have user key
		# because the form contains a user class, rails knows to create a hash with symbol user
		params.require(:user).permit(:name, :email, :location, :password, :password_confirmation)
	end

end

