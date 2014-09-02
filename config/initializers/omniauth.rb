Rails.application.config.middleware.use OmniAuth::Builder do
	MOVES_KEY = Rails.application.secrets.moves_key
	MOVES_SECRET = Rails.application.secrets.moves_secret

	provider :developer unless Rails.env.production?
	provider :moves, MOVES_KEY, MOVES_SECRET
end
