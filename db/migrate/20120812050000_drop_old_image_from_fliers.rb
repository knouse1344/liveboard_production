class DropOldImageFromFliers < ActiveRecord::Migration
  def self.up
    remove_column :fliers, :image_uid
  end

  def self.down
  end
end
