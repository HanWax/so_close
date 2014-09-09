class AddColumnToMiss < ActiveRecord::Migration
	def change
		add_column :misses, :distance, :float
		add_column :misses, :time, :datetime
		add_reference :misses, :user, index: true

	end
end
