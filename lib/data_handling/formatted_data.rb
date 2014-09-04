class FormattedData

	def initialize(raw_data)
		@raw_data = raw_data
		@steps = []
	end

	def raw_data
		@raw_data
	end

	def steps
		@steps
	end

	def get_steps
		from_each_segment
	end

	def from_each_segment
		segments = @raw_data[0]['segments']

		segments.each_with_index do |val, segment_index|

			activities = segments[segment_index]['activities']

			check_for(activities)

		end
	end

	def check_for(activities)
		if activities
			for_all(activities)
		end
	end

	def for_all(activities)
		activities.each_with_index do |val, activity_index|

			track_points = activities[activity_index]['trackPoints']

			get_all(track_points)
		end
	end

	def get_all(track_points)
		track_points.each do |track_point|
			track_point['time'] = convert_to_time(track_point['time'])
			@steps <<  track_point
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