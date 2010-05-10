require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_belong_to :department
  should_have_many :received_notifications
  should_have_many :published_notifications
  should_have_many :subscriptions
  should_have_many :stations,:through=>:subscriptions
  
  context "User" do
    setup do 
      @user = Factory(:normal_user)
    end
    
    context "being sent a notification" do
      setup do
        SmsNotifier.expects(:deliver_sms_message)
        @notification = Factory(:notification)
        @notification.deliver_to!(@user)
      end
      
      should "have a record of receiving notification" do
        assert_equal @notification,@user.received_notifications.last.notification
      end
    end    
  end
end
