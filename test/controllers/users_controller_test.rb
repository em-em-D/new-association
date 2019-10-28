# frozen_string_literal: true

# :nodoc:
require 'test_helper'
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
