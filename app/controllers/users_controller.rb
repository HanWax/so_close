class UsersController < ApplicationController
	def show
	end

	def index
		@users = User.search(params[:search], current_user)
	end
end
