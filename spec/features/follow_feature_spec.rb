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

	after(:all) do
		OmniAuth.config.test_mode = false
	end

	before do
		User.create(:name => 'Eddie', uid: '1234567890987')
		User.create(:name => 'Charles', uid: '1234567809832745')
	end

	context 'searching for friends' do
		it 'should return the search results based on the search term used' do
			visit '/auth/facebook'
			visit '/auth/moves'
			visit '/users'
			fill_in 'search', with: 'e'
			click_button('Find friends')
			save_and_open_page
			expect(page).to have_content('Eddie')
		end
	end

end
