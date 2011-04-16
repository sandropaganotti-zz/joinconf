class UsersToAttendees < ActiveRecord::Migration
  def self.up
    rename_column(:conferences, :users_max, :attendees_max)
    rename_column(:conferences, :users_count, :attendees_count)
  end

  def self.down
    rename_column(:conferences, :attendees_max, :users_max)
    rename_column(:conferences, :attendees_count, :users_count)
  end
end
