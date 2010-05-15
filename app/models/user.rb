class User < ActiveRecord::Base
  include Clearance::User
  
  belongs_to :department
  has_many :published_notifications,:class_name=>"Notification"
  has_many :received_notifications
  has_many :subscriptions
  has_many :stations,:through=>:subscriptions
  
  validates_uniqueness_of :mobile_phone
  validates_length_of :mobile_phone,:is=>10
  
  def subscribed_to?(station)
    subscriptions.for_station(station).size > 0
  end
end
