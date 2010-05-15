class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :station
  
  named_scope :for_station,lambda{|station| {:conditions=>{:station_id=>station.id}}}
end
