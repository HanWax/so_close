require 'rails_helper'

	describe 'bulletins' do

		before(:all) do
			OmniAuth.config.test_mode = true
			OmniAuth.config.mock_auth[:moves] = OmniAuth::AuthHash.new(
				{
					:uid => '123456789',
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
				visit '/auth/moves'
				visit '/bulletins'
				expect(page).to have_content 'Wow, you need to get out more dude. Like seriously...'
			end

		end

		context 'with misses' do

			it 'will display a bulletin with any misses' do
				visit '/bulletins'
				expect(page).to have_content '200m'
			end

		end
	end

