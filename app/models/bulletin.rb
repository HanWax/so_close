class Bulletin

	def initialize(miss)
		@user1 = miss.user.name
		@user2 = miss.neighbour.name
		@time = miss.time.hour
		@distance = miss.distance
	end

	attr_accessor :user1, :user2, :time, :distance

	def message_randomizer(selection = randomize)
		time = time_converter(@time)
		distance = distance_converter(@distance)
		["Your pursuit of #{@user2} lead you to within #{distance}, but alas they evaded your advances once more",
		 "#{@user1}, narrowly avoided the clasps of cloaked assassin #{@user2}", "#{time} #{@user1} averted a social disaster by sidestepping recent love interest #{@user2}’s path", "Take Care! #{time} #{@user2} almost caught sight of you (don’t forget about that restraining order!)", "Faire attention! #{@user2} got within #{distance} of you, and they’re looking for revenge.", "#{@user1} and #{@user2} were a mere #{distance} from crossing paths on the battlefield, the duel the world is waiting for will have to wait another day.", "Just #{distance} separated you and your arch-nemesis #{@user2}. Keep safe...", "Your pursuit of #{@user2} lead you to within #{distance}, but alas they evaded your advances once more", "Despite #{@user1}'s Achilles-like endurance, #{@user2} was just too quick to catch, just #{distance} separated our two heroes", "#{time}, #{@user2} looked set to bump into #{@user1}, but with the distance between them at but #{distance}, a twist of fate pulled them in different directions. #{@user2} must act quickly, #{@user1} is scheduled to board the ferry back to Biarritz any day now..."][selection]
	end

	def time_converter(time)
		if time >= 0 && time < 3
			time = 'In the wee hours of the morn'
		elsif time >= 3 && time < 6
			time = 'At a debauched hour of the night'
		elsif time >= 6 && time < 9
			time = "In the moments before the cock's first crow"
		elsif time >= 9 && time < 12
			time = 'At the break of day'
		elsif time >= 12 && time < 15
			time = 'Around the time of luncheon'
		elsif time >= 15 && time < 18
			time = 'In the lead up to tea time'
		elsif time >= 18 && time < 21
			time = 'After the working day was done'
		elsif time >= 21 && time < 24
			time = 'In the run-up to midnight'
		else
			time = 'At a time not yet understood by physics'
		end
	end

	def distance_converter(distance)
		if distance >= 0.02 && distance < 0.05
			distance = "a stone's throw"
		elsif distance >= 0.05 && distance < 0.075
			distance = "three blocks"
		elsif distance >= 0.075 && distance < 0.1
			distance = "100 yards"
		elsif distance >= 0.1 && distance < 0.15
			distance = "a football pitch"
		else
			distance = "a longbow's range"
		end
	end

	def randomize
		(0..9).to_a.sample
	end

end
