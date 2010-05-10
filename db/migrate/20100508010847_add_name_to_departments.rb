class AddNameToDepartments < ActiveRecord::Migration
  def self.up
   # add_column :departments, :name, :string
  end

  def self.down
    remove_column :departments, :name
  end
end
