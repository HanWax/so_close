class UsersController < ApplicationController
	def show

	end

	def index
		@current_user = current_user

		unless params[:search].blank?
			@users = User.search(params[:search], current_user)
		else
			@users =  []
		end
	end
end
