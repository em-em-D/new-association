# frozen_string_literal: true

require 'rails_helper'
# :nodoc:
class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get user_new_url
    assert_response :success
  end

  test 'should get show' do
    get user_show_url
    assert_response :success
  end
end
