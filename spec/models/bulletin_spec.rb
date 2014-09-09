require 'rails_helper'

require 'Bulletin'

describe 'bulletins' do

	let(:bulletin)  			{ Bulletin.new("Charles", "Eddie", 18.02, 199) }

	context 'when created' do

		it 'should have a user1' do
			expect(bulletin.user1).to eq('Charles')
		end

		it 'should have a user2' do
			expect(bulletin.user2).to eq('Eddie')
		end

		it 'should have a time' do
			expect(bulletin.time).to eq(18.02)
		end

		it 'should have a distance' do
			expect(bulletin.distance).to eq(199)
		end

	end

	context 'conversion methods' do

		it 'should convert the time into a string' do
			time = 18.02
			expect(bulletin.time_converter(time)).to eq 'After the working day was done'
		end

		it 'should convert the distance into a string' do
			distance = 100
			expect(bulletin.distance_converter(distance)).to eq "a longbow's range"
		end

	end

	context 'displaying bulletin messages' do

		it 'should display the compiled bulletin message' do
			expect(bulletin.message_randomizer(9)).to eq "After the working day was done, Eddie looked set to bump into Charles, but with the distance between them at but a longbow's range, a twist of fate pulled them in different directions. Eddie must act quickly, Charles is scheduled to board the ferry back to Biarritz any day now..."
		end
	end


end
