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
			@steps <<  track_points
		end
	end



end