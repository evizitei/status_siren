require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  should_have_many :stations
end
