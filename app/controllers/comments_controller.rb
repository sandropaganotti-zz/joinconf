class CommentsController < ApplicationController
  before_filter :controller_setup
  before_filter :authenticate_user!, :only => [:create]  
  
  def create
    @comment = @current_commentable.comments.build(params[:comment].merge(:user_id => current_user.id))
    if @comment.save 
      flash[:notice] = I18n.t(:comment_successfully)
      redirect_to :back
    else
      flash[:error] = I18n.t(:comment_error)
      index && render(:action => :index)
    end
  end
  
  def index
    @comment ||= Comment.new
    @comments = @current_commentable.comments.reload
  end
  
  private 
  
  def controller_setup
    @current_conference  = Conference.find(params[:conference_id]) 
    @current_session     = @current_conference.sessions.find(params[:session_id]) if params[:session_id]
    @current_commentable = @current_session || @current_conference
    @current_commentable_stack = [@current_conference, @current_session].compact
  end
  
  
end
