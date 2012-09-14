class AddCreatorIdToFlier < ActiveRecord::Migration
  def self.up
    add_column :fliers, :creator_id, :integer
  end

  def self.down
    remove_column :fliers, :creator_id, :integer
  end
end
