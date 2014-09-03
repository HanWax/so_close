class HomepageController < ApplicationController
	def show
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end
end
