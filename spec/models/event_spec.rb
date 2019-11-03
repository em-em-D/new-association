# frozen_string_literal: true

require 'rails_helper'
# :nodoc:
class EventTest < ActiveSupport::TestCase
  def setup
    @michael = users(:michael)
    @luna = users(:archer)
  end

  test 'should be valid' do
    assert @michael.valid?
  end

  test 'name should be present' do
    @michael.username = '     '
    assert_not @michael.valid?
  end

  test 'email should be present' do
    @michael.email = '     '
    assert_not @michael.valid?
  end
end
