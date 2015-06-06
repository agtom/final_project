require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
	
	# named route from routes.rb
	test "invalid signup info" do
		get signup_path
		# ensure count doesn't change
		# put code in block that we want to not change User.count
		assert_no_difference "User.count" do
			post users_path, 
			user: {name: "",
				   email: "user@invalid",
				   password: "foo",
				   password_confirmation: "bar"}
		end
		# ensure re-renders new template
		assert_template 'users/new'
	end

	test "valid signup info" do
		get signup_path
		# ensure count doesn't change
		# put code in block that we want to not change User.count
		assert_difference "User.count", 1 do
			# post doesn't follow redirect so we have to tell the test to follow it 
			post_via_redirect users_path, 
			user: {name: "alexandra",
				   email: "alex@mayfield.com",
				   password: "banana",
				   password_confirmation: "banana"}
		end
		# ensure renders show template
		assert_template 'users/show'
	end
	
end
