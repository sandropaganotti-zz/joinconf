class Conference < ActiveRecord::Base
  
  validates_presence_of :name, :start, :end, :users_max, :location
  default_scope :order => "start DESC"
  
  has_many :sessions
  has_many :attendees
  has_many :comments, :as => :commentable
  
end
