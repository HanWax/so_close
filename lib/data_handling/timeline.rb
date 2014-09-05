class Timeline

	def initialize(data)
		@data = data
		@timeslots = []
	end

	def steps
		@data.steps
	end

	def places
		@data.places
	end

	def output
		[]
	end

	def timeslots
		@timeslots
	end

	def make_timeslots_for(current_datetime)

		next_date = day_after(current_datetime)

		while current_datetime != next_date do

			timeslot_structure = { 'timeslot_start' => current_datetime, 'locations' => [] }

			@timeslots << timeslot_structure

			current_datetime = next_timeslot(current_datetime)

		end

	end

	def day_after(current_date)
		current_date + (60 * 60 * 24)
	end

	def next_timeslot(current_datetime)
		current_datetime + 300
	end

	def belongs_to_timeslot?(step_time, current_datetime)
		current_datetime <= step_time && step_time < (next_timeslot(current_datetime))
	end

	def get_steps

		@timeslots.each do |timeslot|

			current_timeslot = timeslot['timeslot_start']

			match_steps_to(current_timeslot)

		end

		# puts @timeslots

	end

	def match_steps_to(current_timeslot)

		@data.steps.each_with_index do |step, index|

			if belongs_to_timeslot?(step['time'], current_timeslot)

				put_into_timeslot(step, index)

			end

		end

	end

	def put_into_timeslot(info, index)
		@timeslots[index]['locations'] << info
	end

end