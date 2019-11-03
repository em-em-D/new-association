# frozen_string_literal: true

require 'rails_helper'
# :nodoc:
class EventsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get events_index_url
    assert_response :success
  end

  test 'should get new' do
    get events_new_url
    assert_response :success
  end

  test 'should get show' do
    get events_show_url
    assert_response :success
  end
end
