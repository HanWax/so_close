class FollowsController < ApplicationController

	def index
		@current_user = current_user
	end

	def create
		@user = User.find(params[:user_id])
		current_user.follow(@user)
		redirect_to '/users'
	end

end
