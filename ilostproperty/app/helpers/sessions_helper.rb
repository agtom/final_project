module SessionsHelper
	# modules are a way that ruby allows you to collect a bunch of related methods and then include them into a class
	# we will include this into the application controller - the base class of all the controllers to ensure it's available everywhere
	
	def log_in(user)
	# rails come swith a special method 'session' which puts a temporary cookie on the browser that encrypts the user id in the browser
	session[:user_id] = user.id

	end
	
	# having placed user id into session, we need to be able to retrieve that user on the next page; returns current logged in user (if any)
	def current_user
		# because we've put the id in the session we can pull it out using the same code
		# find_by returns nil rather than an error if the user doesn't exist
		# remembers the @current_user value so we dont have to hit the database over and over
		@current_user = @current_user || User.find_by(id: session[:user_id])
	end

	# returns true if the user is logged in
	def logged_in?
		# not nil, i.e. logged in
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

end
