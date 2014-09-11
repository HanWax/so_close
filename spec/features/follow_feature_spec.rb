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
		eddie = User.create(:name => 'Eddie', uid: '1234567890987')
		charles = User.create(:name => 'Charles', uid: '1234567809832745')
		visit '/auth/facebook'
		visit '/auth/moves'
		visit '/users'
	end

	context 'searching for friends' do
		it 'should return the search results based on the search term used' do
			fill_in 'search', with: 'e'
			click_button('Find friends')
			expect(page).to have_content('Eddie')
		end
	end

	context 'friends' do
		it 'user should be able to add friends' do
			fill_in 'search', with: 'c'
			click_button('Find friends')
			expect(page).to have_link('Friend')
			click_link('Friend')
			save_and_open_page
			expect(Follow.first).not_to be_nil
		end

		it 'user should be able to unfriend' do
			fill_in 'search', with: 'c'
			click_button('Find friends')
			expect(page).to have_link('Friend')
			click_link('Friend')
			click_link('Un-friend')
			expect(Follow.first).to be_nil
		end
	end

end
