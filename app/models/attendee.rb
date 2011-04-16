class Attendee < ActiveRecord::Base
  
  validates_uniqueness_of :conference_id, :scope => :user_id
  belongs_to :user
  belongs_to :conference, :counter_cache => true
  
end