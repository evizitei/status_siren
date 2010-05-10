require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  should_belong_to :station
  should_belong_to :user
end
