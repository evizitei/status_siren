class CreateReceivedNotifications < ActiveRecord::Migration
  def self.up
    create_table :received_notifications do |t|
      t.integer :user_id
      t.integer :notification_id

      t.timestamps
    end
  end

  def self.down
    drop_table :received_notifications
  end
end
