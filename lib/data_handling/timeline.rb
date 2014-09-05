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

	def make_timeslots_for(current_date)

		next_date = day_after(current_date)

		while current_date != next_date do
			@timeslots << current_date
			current_date = next_timeslot(current_date)
		end

	end

	def day_after(current_date)
		current_date + (60 * 60 * 24)
	end

	def next_timeslot(current_date)
		current_date + 300
	end
end