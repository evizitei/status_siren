class Notification < ActiveRecord::Base
  has_sms_fu
  belongs_to :station
  belongs_to :user

  def deliver!
    station.subscriptions.each do |subscription|
      deliver_to!(subscription.user)
    end
  end
  
  def deliver_to!(user)
    deliver_sms(user.mobile_phone,user.mobile_carrier,self.message,:from => "noreply@statussiren.com")
    user.received_notifications.create!(:notification=>self)
  end
end
