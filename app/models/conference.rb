class Conference < ActiveRecord::Base
  
  validates :name, :start, :end, :users_max, :location,
            :presence => true
  default_scope :order => "start DESC"
  
  has_many :sessions
  has_many :attendees
  has_many :comments, :as => :commentable
  
end
