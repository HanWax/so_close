class FormattedData

	def initialize(raw_data)
		@raw_data = raw_data
		@steps = []
		@places = []
	end

	def raw_data
		@raw_data
	end

	def steps
		@steps
	end

	def places
		@places
	end

	def format!
		segments = @raw_data[0]['segments']

		# puts segments.length
		# count = 0

		segments.each_with_index do |val, segment_index|

			get_steps(segments, segment_index)
			# get_places(segments, segment_index)

			# count = count + 1
			# puts count

		end
			# puts '*'
	end

	def get_steps(segments, segment_index)
		activities = segments[segment_index]['activities']

		if activities
			get_steps_from(activities)
		end
	end

	def get_places(segments, segment_index)
		puts segment_index
		current_segment = segments[segment_index]

		start_time = current_segment['startTime']
		end_time = current_segment['endTime']

		place = current_segment['place']
		# puts place

		get_place_location(place)
		# lat = place_location['location']['lat']
		# lon = place_location['lon']

		# place =  {
		# 	start_time: start_time,
		# 	end_time: end_time,
		# 	lat: lat,
		# 	lon: lon
		# }

		# @places << place
	end

	def get_place_location(place)
		puts place
		# lat = place['location']
		# lon = place['lon']
	end

	def get_steps_from(activities)
		activities.each_with_index do |val, activity_index|

			steps = activities[activity_index]['trackPoints']

			get_all(steps)
		end
	end

	def get_all(steps)
		steps.each do |step|

			step['time'] = convert_to_time(step['time'])
			@steps << step

		end
	end

	def convert_to_time(time_stamp)
		# example time stamp: "20140902T083008+0100"
		# split as follows: 2014 09 02 T 08 30 08 +01 00
		# collects within (), returns series of 'matches', numbered in sequential order
		# unhuman code for unhuman timestamps...
		split_stamp = time_stamp.match(/(\d{4})(\d{2})(\d{2})T(\d{2})(\d{2})(\d{2})(.{3})(\d{2})/)

		year = split_stamp[1] # first match, first in sequence, as year is first in timestamp
		month =  split_stamp[2]
		day = split_stamp[3]

		hour = split_stamp[4]
		minutes = split_stamp[5]
		seconds = split_stamp[6]

		time_zone_hour = split_stamp[7]
		time_zone_minute = split_stamp[8]
		time_zone = "#{time_zone_hour}:#{time_zone_minute}" # time class expects string with :

		Time.new(year, month, day, hour, minutes, seconds, time_zone)
	end

end