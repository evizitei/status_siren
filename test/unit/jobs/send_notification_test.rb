require 'test_helper'

class SendNotificationTest < ActiveSupport::TestCase
  context "sending a status 0 notification" do
    setup do
      @sender = Factory(:normal_user)
      @message = "Station 14 will be status 0 until 5:30 PM"
      @station = Factory(:station)
      @subscriber = Factory(:normal_user)
      Factory(:subscription,:user=>@sender,:station=>@station)
      Factory(:subscription,:user=>@subscriber,:station=>@station)
      SmsNotifier.expects(:deliver_sms_message).at_least_once
      SendNotification.new(@sender,@station,@message).perform
    end
    
    should "deliver message to subscriber" do
      assert_equal @message,@subscriber.received_notifications.last.message
    end
    
    should "deliver message to sender" do
      assert_equal @message,@sender.received_notifications.last.message
    end
    
    should "register message as belonging to sender" do
      assert_equal @subscriber.received_notifications.last.notification_id,@sender.published_notification_ids.last
    end
    
    should "register notification with the station" do
      assert_equal @sender.published_notification_ids.last,@station.notification_ids.last
    end
  end
end