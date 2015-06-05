module ApplicationHelper
	# methods defined here are available in views of our application
	# Returns full title on a per-page basis
	# page_title = '' gives page_title a default value of an empty string
	def full_title(page_title = '')
		base_title = "Sample App"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end
end

