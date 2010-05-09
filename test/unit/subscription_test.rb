require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  should_belong_to :station
  should_belong_to :user
end
