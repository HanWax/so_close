class HomepageController < ApplicationController

	def show
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		# else
		# 	redirect_to '/auth/facebook'
		# 	# redirect_to '/layouts/application'
		end
	end
end
