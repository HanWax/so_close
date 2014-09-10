class User < ActiveRecord::Base

	acts_as_followable
	acts_as_follower

	def self.find_or_create_from_auth_hash(auth_hash)

		# case auth_hash["moves"]
		# when 'moves'
		uid = auth_hash["uid"].to_s
		# raise auth_hash['credentials'].inspect

		credentials = ::OauthCredentials.find_or_create_by(uid: uid)
		credentials.attributes = {
			provider: auth_hash["provider"],
			token: auth_hash["credentials"]["token"],
			refresh_token: auth_hash["credentials"]["refresh_token"],
			expires_at: Time.at(auth_hash["credentials"]["expires_at"]),
		}
		credentials.user ||= User.create(uid: uid, name: auth_hash['info']['name'])
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
			provider: auth_hash["provider"],
			token: auth_hash["credentials"]["token"],
			refresh_token: auth_hash["credentials"]["refresh_token"],
			expires_at: Time.at(auth_hash["credentials"]["expires_at"]),
		}
		credentials.user = self
		credentials.save!
	end

	def moves_token
		oauth_credentials.find_by(provider: 'moves').token
	end

	has_many :misses
	has_many :identities
	has_one :moves_oauth_credentials
	has_many :oauth_credentials, class_name: ::OauthCredentials

	def moves
		@moves ||= Moves::Client.new(moves_oauth_credentials.token)
	end

	def self.search(query, current_user)
		where("name ILIKE ?", "%#{query}%").reject {|u| u == current_user }
	end
end
