require Rails.root.join('lib', 'data_handling', 'formatted_data.rb')
require Rails.root.join('lib', 'data_handling', 'compare_timelines.rb')
require Rails.root.join('lib', 'data_handling', 'timeline.rb')
require Rails.root.join('lib', 'data_handling', 'convert_timestamp.rb')
# require Rails.root.join('lib', 'bulletin.rb')

class BulletinsController < ApplicationController

	def index

		users = (User.all)
		other_users = users.reject {|user| user.id == current_user.id}

		# puts '********************************'
		# puts current_user.id
		# puts users.first.id
		# puts users.last.id
		# puts other_users.first.id
		# puts '********************************'



		current_user_moves = Moves::Client.new(current_user.oauth_credentials.last.token)
		@current_user_timeline = Timeline.new(FormattedData.new(current_user_moves.daily_storyline(:trackPoints => true)), Time.new(2014, 9, 2, 0, 0, 0, '+01:00'))

		@neighbour = other_users.first
		neighbour_moves = Moves::Client.new(@neighbour.oauth_credentials.last.token)
		@neighbour_timeline = Timeline.new(FormattedData.new(neighbour_moves.daily_storyline(:trackPoints => true)), Time.new(2014, 9, 2, 0, 0, 0, '+01:00'))

		@comparison =  CompareTimelines.new(timeline_a: @neighbour_timeline, timeline_b: @current_user_timeline, current_user_id: current_user.id, neighbour_id: @neighbour.id)
		# Miss.create(distance: 0.1, time: Time.now, user_id: current_user.id, neighbour_id: @neighbour.id)
		# @misses = @comparison.misses
		# @bulletin = Bulletin.new(current_user.id, @neighbour.id, 12, 50)
		@bulletins = []
		current_user.misses.each do | miss |
			@bulletins << Bulletin.new(miss)
		end
		
	end

end
