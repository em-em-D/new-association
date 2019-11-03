# frozen_string_literal: true

# :nodoc:
module ApplicationHelper
  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = 'kindly log in'
    redirect_to login_url
  end
end
