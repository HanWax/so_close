class SessionsController < ApplicationController
	skip_before_filter :ensure_authenticated!

	def create
		if current_user
			current_user.add_credentials_with(auth_hash)
		else
			create_user
		end

		if auth_hash[:provider] == "facebook"
			# raise 'hello'
			# OmniAuth.config.test_mode = false

			redirect_to '/auth/moves'
		else
			redirect_to '/'
		end
	end

	def destroy
		session.clear
		redirect_to '/'
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end

	def create_user
		@current_user = User.find_or_create_from_auth_hash(auth_hash)
		session[:user_id] = @current_user.id
		current_user_uid = @current_user.uid
	end
end
