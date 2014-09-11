class FollowsController < ApplicationController

	def index
		@current_user = current_user
	end

	def create
		@current_user = current_user
		@user = User.find(params[:user_id])
		current_user.follow(@user)
		redirect_to '/users'
	end

	def destroy
		@current_user = current_user
		@user = User.find(params[:user_id])
		current_user.stop_following(@user)
		redirect_to '/users'
	end

	def show
	end

end
