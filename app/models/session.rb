class Session < ActiveRecord::Base

  validates_presence_of :name, :start, :length, :conference_id, :user_id
  belongs_to  :conference
  has_many    :comments, :as => :commentable
  belongs_to  :speaker,  :class_name => 'User', :foreign_key => 'speaker_id'
  default_scope :order => 'start'

end
