require 'rails_helper'

require 'Bulletin'
require 'User'
require 'Miss'

describe 'bulletins' do

	let(:user1) { User.create(name: 'Charles') }
	let(:user2) { User.create(name: 'Eddie') }
	# let(:user1)					{ double: :user, name: 'Eddie', id: 1}
	# let(:user2)					{ double: :user, name: 'Charles', id: 2}
	# let(:miss)					{ Miss.create(user_id: 1, neighbour_id: 2, distance: 199, time: 19)}

	let(:miss)					{ Miss.new(distance: 0.11, time: Time.new(2008,6,21, 13,30,0, "+18:02"), user_id: user1.id, neighbour_id: user2.id)}
	let(:bulletin)  			{ Bulletin.new(miss)}

	context 'when created' do

		it 'should have a user1' do
			expect(bulletin.user1).to eq('Charles')
		end

		it 'should have a user2' do
			expect(bulletin.user2).to eq('Eddie')
		end

		it 'should have a time' do
			expect(bulletin.time).to eq(19)
		end

		it 'should have a distance' do
			expect(bulletin.distance).to eq(0.11)
		end

	end

	context 'conversion methods' do

		it 'should convert the time into a string' do
			time = 19
			expect(bulletin.time_converter(time)).to eq 'After the working day was done'
		end

		it 'should convert the distance into a string' do
			distance = 100
			expect(bulletin.distance_converter(distance)).to eq "a longbow's range"
		end

	end

	context 'displaying bulletin messages' do

		it 'should display the compiled bulletin message' do
			expect(bulletin.message_randomizer(9)).to eq "After the working day was done, Eddie looked set to bump into Charles, but with the distance between them at but a football pitch, a twist of fate pulled them in different directions. Eddie must act quickly, Charles is scheduled to board the ferry back to Biarritz any day now..."
		end
	end


end
