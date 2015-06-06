module UsersHelper

	#Returns the Gravatar for the given user
	def gravatar_for(user)
		# MD5 hash is case sensitive so we need to downcase; associates an image with your email
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end
