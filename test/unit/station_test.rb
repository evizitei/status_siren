require 'test_helper'

class StationTest < ActiveSupport::TestCase
  should_belong_to :department
  should_have_many :notifications
  should_have_many :subscriptions
  
end
