require 'rails_helper'

describe 'bulletins' do

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

	after(:all) do
		OmniAuth.config.test_mode = false
	end

	before do
		User.create(uid: '123456789')
	end

	context 'without misses' do

		it "will display a concerned message" do
			# visit 'http://localhost:5000/'
			# click_link 'Sign in'
			visit '/auth/facebook'
			visit '/auth/moves'
			visit '/bulletins'
			expect(page).to have_content "Strangely we can't find any near-misses for you, perhaps you ought to spend less time in dark alleys and get out into the sun eh?"
		end

	end

	context 'with misses' do

		it 'will display a bulletin with any misses' do
			visit '/bulletins'
			expect(page).to have_content '200m'
		end

	end
end
