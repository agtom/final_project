class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		# no need to use an instance variable as we are not rendering a form
  		redirect_to user
  	else
  		# use flash.now when rendering a page rather than redirecting
		flash.now[:danger] = "invalid email/password combo"
		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
