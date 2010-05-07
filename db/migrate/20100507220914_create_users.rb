class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :department_id
      t.string :name
      t.string :mobile_phone
      t.string :mobile_carrier
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
