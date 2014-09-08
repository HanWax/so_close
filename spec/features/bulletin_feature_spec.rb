require 'rails_helper'

describe 'bulletins' do

	context 'without misses' do

		it "will display a concerned message" do
			visit '/'
			# save_and_open_page
			expect(page).to have_content 'Wow, you need to get out more dude. Like seriously...'
		end

	end

	context 'with misses' do

		it 'will display a bulletin with any misses' do
			visit '/'
			expect(page).to have_content 'blah blah blah'
		end

	end
end
