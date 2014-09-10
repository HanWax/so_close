require Rails.root.join('lib', 'data_handling', 'formatted_data.rb')
require Rails.root.join('lib', 'data_handling', 'compare_timelines.rb')
require Rails.root.join('lib', 'data_handling', 'timeline.rb')
require Rails.root.join('lib', 'data_handling', 'convert_timestamp.rb')
# require Rails.root.join('lib', 'bulletin.rb')

class BulletinsController < ApplicationController

	def index

		users = (User.all)

		if current_user && !current_user.all_following.empty?
			friends = current_user.all_following

			yesterday = Date.today.prev_day

			current_user_moves = Moves::Client.new(current_user.moves_token)
			@current_user_timeline = Timeline.new(FormattedData.new(current_user_moves.daily_storyline(yesterday, :trackPoints => true)), yesterday)

			friends.each do |friend|

					#@neighbour = friends.first
					friend_moves = Moves::Client.new(friend.moves_token)
					@friend_timeline = Timeline.new(FormattedData.new(friend_moves.daily_storyline(yesterday, :trackPoints => true)), yesterday)

					@comparison =  CompareTimelines.new(timeline_a: @friend_timeline, timeline_b: @current_user_timeline, current_user: current_user, neighbour: friend, outer_limit: 0.2, inner_limit: 0.02)

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

		else
			if current_user && current_user.all_following.empty?
				redirect_to user_follows_path(current_user)
			end
		end

	end

end
