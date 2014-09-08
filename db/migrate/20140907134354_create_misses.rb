class CreateMisses < ActiveRecord::Migration
  def change
    create_table :misses do |t|

      t.timestamps
    end
  end
end
