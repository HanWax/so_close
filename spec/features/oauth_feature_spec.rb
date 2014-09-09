require 'rails_helper'

describe 'logging in with FB', js: true do
	xit 'shows the FB login screen' do
		visit 'http://localhost:5000/'
		click_link 'Sign in'
		sleep 5
		expect(page).to have_content 'Facebook Login'
	end

	xit 'shows the Moves login screen after a FB login' do
		visit 'http://localhost:5000/'
		click_link 'Sign in'
		sleep 5
		fill_in 'Email', with: 'rjqcucp_bharambesky_1410169837@tfbnw.net'
		fill_in 'Password', with: 'password'
		click_button 'Log in'
		expect(page).to have_content 'Moves'
	end

	xit 'does not show moves login if FB login password is not valid' do
		visit 'http://localhost:5000/'
		click_link 'Sign in'
		sleep 5
		fill_in 'Email', with: 'rjqcucp_bharambesky_1410169837@tfbnw.net'
		fill_in 'Password', with: 'badpassword'
		click_button 'Log in'
		expect(page).not_to have_content 'Moves'
	end
end

describe 'logging in with Moves', js:true do
	before do
		visit 'http://localhost:5000/'
		click_link 'Sign in'
		sleep 5
		fill_in 'Email', with: 'rjqcucp_bharambesky_1410169837@tfbnw.net'
		fill_in 'Password', with: 'password'
	end


	xit 'redirects after a correct pin' do
		click_button 'Log in'
		puts "Please enter the following PIN " + find(:css, '.pincode').text
		gets
		expect(current_url).to eq 'http://localhost:5000/'
		# 	end
	end
end
