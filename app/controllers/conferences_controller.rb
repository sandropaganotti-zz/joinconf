class ConferencesController < ApplicationController
  
  def index
    @conferences = Conference.all
  end
  
  def show
    @conference = Conference.find(params[:id])
  end
  
end
