class AddMissIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :miss_id, :integer
  end
end
