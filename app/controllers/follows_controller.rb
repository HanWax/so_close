class FollowsController < ApplicationController

	def index
		@current_user = current_user
	end

	def create
		@user = User.find(params[:user_id])
		current_user.follow(@user)
		redirect_to '/users'
	end

	def destroy
		@user = User.find(params[:user_id])
		current_user.stop_following(@user)
		redirect_to '/users'
	end

	def show
	end

end
