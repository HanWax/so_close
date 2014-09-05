require_relative 'convert_timestamp'

class FormattedData

	include ConvertTimeStamp

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

		segments.each_with_index do |val, segment_index|

			get_steps(segments, segment_index)
			# get_places(segments, segment_index)

		end
	end

	def get_steps(segments, segment_index)
		activities = segments[segment_index]['activities']

		if activities
			get_steps_from(activities)
		end
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

end