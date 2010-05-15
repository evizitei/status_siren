require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  should_belong_to :station
  should_belong_to :user
  
  should "have scope for station id" do
    station = Factory(:station)
    subscription = Factory(:subscription,:station=>station)
    assert Subscription.for_station(station).any?{|sub| sub.station == station}
  end
end
