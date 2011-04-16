class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.string :name
      t.date :start
      t.date :end
      t.integer :users_max
      t.integer :users_count
      t.text :description
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :conferences
  end
end
