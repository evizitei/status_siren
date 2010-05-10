class Station < ActiveRecord::Base
  belongs_to :department
  has_many :notifications
  has_many :subscriptions
end
