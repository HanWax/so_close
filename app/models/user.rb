class User < ActiveRecord::Base

	def self.find_or_create_from_auth_hash(auth_hash)

		# case auth_hash["moves"]
		# when 'moves'
		uid = auth_hash["uid"].to_s
		credentials = ::OauthCredentials.find_or_create_by(uid: uid)
		credentials.attributes = {
			token: auth_hash["credentials"]["token"],
			refresh_token: auth_hash["credentials"]["refresh_token"],
			expires_at: Time.at(auth_hash["credentials"]["expires_at"]),
		}
		credentials.user ||= User.create(uid: uid)
		credentials.save!
		# else
		# 	raise "unknown provider!"
		# end

		credentials.user
	end

	def add_credentials_with(auth_hash)
		uid = auth_hash["uid"].to_s
		credentials = ::OauthCredentials.find_or_create_by(uid: uid)
		credentials.attributes = {
			token: auth_hash["credentials"]["token"],
			refresh_token: auth_hash["credentials"]["refresh_token"],
			expires_at: Time.at(auth_hash["credentials"]["expires_at"]),
		}
		credentials.user = self
		credentials.save!
	end

	has_many :misses
	has_many :identities
	has_one :moves_oauth_credentials
	has_many :oauth_credentials, class_name: ::OauthCredentials

	def moves
		@moves ||= Moves::Client.new(moves_oauth_credentials.token)
	end
end
