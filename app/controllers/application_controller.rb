class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setup_application
  
  private
  
  def setup_application
    @title = "JoinCoooonf"
    @subtitle = "un servizio che forse non serviva"
  end
end
