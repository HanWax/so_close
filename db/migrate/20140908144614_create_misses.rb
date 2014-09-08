class CreateMisses < ActiveRecord::Migration
  def change
    create_table :misses do |t|
      t.Fixnum :distance
      t.DateTime :time

      t.timestamps
    end
  end
end
