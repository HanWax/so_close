Rails.application.config.middleware.use OmniAuth::Builder do

	# FACEBOOK_KEY = Rails.application.secrets.facebook_key
	# FACEBOOK_SECRET = Rails.application.secrets.facebook_secret

	# provider :facebook, FACEBOOK_KEY, FACEBOOK_SECRET

	# MOVES_KEY = Rails.application.secrets.moves_key
	# MOVES_SECRET = Rails.application.secrets.moves_secret

	# provider :developer unless Rails.env.production?
	# provider :moves, MOVES_KEY, MOVES_SECRET
	provider :moves, Rails.application.secrets.moves_key, Rails.application.secrets.moves_secret
	provider :facebook, Rails.application.secrets.facebook_key, Rails.application.secrets.facebook_secret
end
