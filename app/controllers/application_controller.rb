# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  require 'attendaces_controller.rb'
  include ApplicationHelper
  # include AttendacesHelper
  include EventsHelper
  include SessionsHelper
  include UsersHelper
  helper_method :signed_in?
end
