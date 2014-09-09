include Math

class CompareTimelines

	def initialize(timeline_a: timeline_a, timeline_b: timeline_b, current_user_id: current_user_id, neighbour_id: neighbour_id, outer_limit: 0.2, inner_limit: 0.02)
		@outer_limit = outer_limit
		@inner_limit = inner_limit
		@misses = []
		@current_user_id = current_user_id
		@neighbour_id = neighbour_id
		compare_timelines(timeline_a, timeline_b)
	end

	def deg2rad(lat, lon) # converts degrees to radians
	  	[lat * PI / 180, lon * PI / 180]
	end
	 
	R = 6367.45  # radius of the Earth, in kilometers

	def distance_between(lat_a, lon_a, lat_b, lon_b)
	  	radlat_a, radlon_a = deg2rad(lat_a, lon_a)
	  	radlat_b, radlon_b = deg2rad(lat_b, lon_b)
	  	2 * R * asin(sqrt(sin((radlat_b-radlat_a)/2)**2 + cos(radlat_a) * cos(radlat_b) * sin((radlon_b - radlon_a)/2)**2)) # Haversine formula
	end

	def time_between(time1, time2)
		(time2 - time1).abs
	end

	def outer_limit
		@outer_limit
	end

	def inner_limit
		@inner_limit
	end

	def did_they_miss?(distance_between)
		distance_between < outer_limit && distance_between > inner_limit
	end

	def misses
		@misses
	end
	
	def compare_timelines(timeline_a, timeline_b)

		counter = 0

		timeline_a.timeslots.each_with_index do | timeslot_a, index_a |

			timeslot_start = timeslot_a['timeslot_start']

			timeslot_b = timeline_b.timeslots[index_a]

			compare_timeslots(timeslot_a, timeslot_b, timeslot_start)

		end

	end

	def compare_timeslots(timeslot_a, timeslot_b, timeslot_start)

		if has_locations?(timeslot_a, timeslot_b)

			compare_locations(timeslot_a['locations'], timeslot_b['locations'], timeslot_start)

		end

	end

	def has_locations?(timeslot_a, timeslot_b)
		timeslot_a['locations'] != [] && timeslot_b['locations'] != []
	end

	def compare_locations(locations_a, locations_b, timeslot_start)

		locations_a.each do |location_a|
			lat_a = location_a['lat']
			lon_a = location_a['lon']

			locations_b.each do |location_b|
				lat_b = location_b['lat']
				lon_b = location_b['lon']

				check_for_miss(lat_a, lon_a, lat_b, lon_b, timeslot_start)
			end
		end
	end

	def check_for_miss(lat_a, lon_a, lat_b, lon_b, timeslot_start)
		distance_between = distance_between(lat_a, lon_a, lat_b, lon_b)

		if did_they_miss?(distance_between)
			register_miss(distance_between, timeslot_start)
		end
	end

	def register_miss(distance_between, timeslot_start)
		# puts "#{timeslot_start} : #{distance_between}"
		# # misses << Miss.new(distance_between, timeslot_start)
		@misses << Miss.new(distance: distance_between, time: timeslot_start, user_id: @current_user_id, neighbour_id: @neighbour_id)
		# puts @misses.length
	end

end