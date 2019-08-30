class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    require 'attendace_controller.rb'


    include ApplicationHelper	
    #include AttendacesHelper	
    include EventsHelper	
    include SessionsHelper	  
    include UsersHelper	
  
    

    helper_method :signed_in?
end
