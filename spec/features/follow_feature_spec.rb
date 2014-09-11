require 'rails_helper'

describe 'follows' do

	before(:all) do
		OmniAuth.config.test_mode = true

		OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
			{
				:provider => :facebook,
				:uid => '123456789',
				:info => { :name => 'John Doe '},
				:credentials => { :token => '12345', :expires_at => 1.week.from_now }
			}
		)

		OmniAuth.config.mock_auth[:moves] = OmniAuth::AuthHash.new(
			{
				:provider => :moves,
				:uid => '234567890',
				:credentials => { :token => '12345', :expires_at => 1.week.from_now }
			}
		)

	end

end
