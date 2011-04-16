class Comment < ActiveRecord::Base
  validates_presence_of :text, :user_id, :commentable_id, :commentable_type
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  default_scope :order => 'created_at DESC'
end
