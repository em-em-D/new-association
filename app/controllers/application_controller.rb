class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session

    include SessionsHelper
    include ApplicationHelper
    

    helper_method :signed_in?
end
