class Bulletin

	def initialize(user1, user2, time, distance)
		@user1 = user1
		@user2 = user2
		@time = time
		@distance = distance
	end

	attr_accessor :user1, :user2, :time, :distance

	def message_randomizer
		time = time_converter(@time)
		["#{user1}, narrowly avoided the clasps of cloaked assassin #{user2}", "#{time} #{user1} averted a social disaster by sidestepping recent love interest #{user2}’s path", "Take Care! #{time} #{user2} almost caught sight of you (don’t forget about that restraining order!)", "Faire attention! #{user2} got within #{distance} of you, and they’re looking for revenge.", "#{user1} and #{user2} were a mere #{distance} yards from crossing paths on the battlefield, the duel the world is waiting for will have to wait another day.", "Just #{distance} yards separated you and your arch-nemesis #{user2}. Keep safe..."].sample
	end

	private

	def time_converter(time)
		if time > 0 && time < 3
			time = 'In the wee hours of the morn'
		elsif time > 3 && time < 6
			time = 'At a debauched hour of the night'
		elsif time > 6 && time < 9
			time = 'At a debauched hour of the night'
		elsif time > 9 && time < 12
			time = 'At the break of day'
		elsif time > 12 && time < 15
			time = 'Around the time of luncheon'
		elsif time > 15 && time < 18
			time = 'In the lead up to tea time'
		elsif time > 18 && time < 21
			time = 'After the working day was done'
		elsif time > 21 && time < 24
			time = 'In the run-up to midnight'
		else
			time = 'At a time not yet understood by physics'
		end
	end

end
