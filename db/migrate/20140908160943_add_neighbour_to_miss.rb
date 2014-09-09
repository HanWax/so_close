class AddNeighbourToMiss < ActiveRecord::Migration
	def change
		add_reference :misses, :neighbour, :class_name => "User", index: true
	end
end
