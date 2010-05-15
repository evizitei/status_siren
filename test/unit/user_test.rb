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
    
    subject { @user }
    should_validate_uniqueness_of :mobile_phone,:email
    should_ensure_length_is :mobile_phone,10
    
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
    
    context "without subscriptions" do
      setup { @user.subscriptions.delete_all}

      should "not register as being subscribed to any station" do
        assert_equal false,@user.subscribed_to?(Factory(:station))
      end
    end
    
    context "with a subscription" do
      setup do
        @station = Factory(:station)
        Factory(:subscription,:user=>@user,:station=>@station)
      end
      
      should "register subscription when asked" do
        assert @user.subscribed_to?(@station)
      end
    end
  end
end
