class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.string :name
      t.text :abstract
      t.datetime :start
      t.integer :length
      t.integer :speaker_id
      t.integer :conference_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
