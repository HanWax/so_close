class AddUserIdToMisses < ActiveRecord::Migration
  def change
    add_column :misses, :user_id, :integer
  end
end
