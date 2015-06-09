class StaticPagesController < ApplicationController
  def home
  	@users = User.all
  	@user = current_user
  	@hash = Gmaps4rails.build_markers(@users) do |user, marker|
  marker.lat user.latitude
  marker.lng user.longitude
	end
  end

  def help
  end

  def about
  end

  def contact
  end

end
