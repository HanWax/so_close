class Bulletin

	def initialize(user1, user2, time, distance)
		@user1 = user1
		@user2 = user2
		@time = time
		@distance = distance
	end

	attr_accessor :user1, :user2, :time, :distance

	def message_randomizer(user1, user2, time, distance)
		["#{user1}, narrowly avoided the clasps of cloaked assassin #{user2}", "#{time} #{user1} averted a social disaster by sidestepping recent love interest #{user2}’s path", "Take Care! #{user2} almost caught sight of you #{time} (don’t forget about that restraining order!)", "Faire attention! #{user2} got within #{distance} of you, and they’re looking for revenge.", "#{user1} and #{user2} were a mere #{distance} from crossing paths on the battlefield, the duel the world is waiting for will have to wait another day.", "Just #{distance} separated you and your arch-nemesis #{user2}. Keep safe..."].sample
	end
