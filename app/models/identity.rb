class Identity < ActiveRecord::Base
	belongs_to :user

	def self.find_with_omniauth(auth)
		find_by(uid: auth['uid'], provider: auth['facebook'])
		find_by(uid: auth['uid'], provider: auth['moves'])
	end

	def self.create_with_omniauth(auth)
		create(uid: auth['uid'], provider: auth['facebook'])
		create(uid: auth['uid'], provider: auth['moves'])
	end
end
