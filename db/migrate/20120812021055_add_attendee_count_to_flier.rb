class AddAttendeeCountToFlier < ActiveRecord::Migration
  def self.up
    add_column :fliers, :added_count, :integer
  end

  def self.down
    remove_column :fliers, :added_count
    
  end
end
