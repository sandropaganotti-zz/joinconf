class AttendeesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]  
  before_filter :controller_setup
  
  def create
    @attendee =  @current_conference.attendees.build(:user => current_user )
    if @attendee.save
      flash[:notice] = I18n.t(:joined_successfully, :name => @current_conference.name) 
    else
      flash[:error]  = I18n.t(:joined_error)
    end
    redirect_to conference_path(@current_conference)
  end
  
  private
  
  def controller_setup
    @current_conference = Conference.find(params[:conference_id])
  end
  
end
