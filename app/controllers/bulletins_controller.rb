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
		@misses = current_user.misses

		@neighbours = (@misses.map {|miss| miss.neighbour_id}).uniq

		@misses_sorted_by_neighbour = @neighbours.map do |neighbour|
			@misses.select {|miss| miss.neighbour_id == neighbour}
		end

		@misses_sorted_by_neighbour_sorted_by_distance = @misses_sorted_by_neighbour.each {|subarray| subarray.sort! {|a, b| a.distance <=> b.distance}}

		@nearest_misses = @misses_sorted_by_neighbour_sorted_by_distance.map {|subarray| subarray.first}

		@bulletins = []

		@nearest_misses.each do |miss|
			@bulletins << Bulletin.new(miss)
		end

	end

end
