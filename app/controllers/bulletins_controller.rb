require Rails.root.join('lib', 'data_handling', 'formatted_data.rb')
require Rails.root.join('lib', 'data_handling', 'compare_timelines.rb')
require Rails.root.join('lib', 'data_handling', 'timeline.rb')
require Rails.root.join('lib', 'data_handling', 'convert_timestamp.rb')
# require Rails.root.join('lib', 'bulletin.rb')

class BulletinsController < ApplicationController

	def index

		users = (User.all)
		other_users = users.reject {|user| user.id == current_user.id}

		yesterday = Date.today.prev_day

		current_user_moves = Moves::Client.new(current_user.moves_token)
		@current_user_timeline = Timeline.new(FormattedData.new(current_user_moves.daily_storyline(yesterday, :trackPoints => true)), yesterday)

		@neighbour = other_users.first
		neighbour_moves = Moves::Client.new(@neighbour.moves_token)
		@neighbour_timeline = Timeline.new(FormattedData.new(neighbour_moves.daily_storyline(yesterday, :trackPoints => true)), yesterday)

		@comparison =  CompareTimelines.new(timeline_a: @neighbour_timeline, timeline_b: @current_user_timeline, current_user: current_user, neighbour: @neighbour, outer_limit: 0.2, inner_limit: 0.02)

		@bulletins = []
		current_user.misses.each do | miss |
			@bulletins << Bulletin.new(miss)
		end

	end

end
