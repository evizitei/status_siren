require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_belong_to :department
end
