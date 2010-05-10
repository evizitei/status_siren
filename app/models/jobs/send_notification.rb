class SendNotification
  def initialize(sender,station,message)
    @sender = sender
    @station = station
    @message = message
  end
  
  def perform
    notification = @sender.published_notifications.create!(:station=>@station,:message=>@message)
    notification.deliver!
  end
end