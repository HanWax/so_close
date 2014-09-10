class FollowsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		current_user.follow(@user)
	end

end
