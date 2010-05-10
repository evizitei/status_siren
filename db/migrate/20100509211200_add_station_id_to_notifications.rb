class AddStationIdToNotifications < ActiveRecord::Migration
  def self.up
    add_column :notifications, :station_id, :integer
  end

  def self.down
    remove_column :notifications, :station_id
  end
end
