class SessionsController < ApplicationController
  before_filter :controller_setup
  
  def index
    @sessions = @current_conference.sessions
  end
  
  def show
    @session = @current_conference.sessions.find(params[:id])
  end
  
  private 
  
  def controller_setup
    @current_conference = Conference.find(params[:conference_id]) 
  end
  
end
