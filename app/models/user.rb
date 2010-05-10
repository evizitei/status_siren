class User < ActiveRecord::Base
  include Clearance::User
  
  belongs_to :department
  has_many :published_notifications,:class_name=>"Notification"
  has_many :received_notifications
  has_many :subscriptions
  has_many :stations,:through=>:subscriptions
end
