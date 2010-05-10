class ReceivedNotification < ActiveRecord::Base
  belongs_to :notification
  delegate :message, :to => :notification
end
