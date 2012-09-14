class RenameColumnImageUrlForFliers < ActiveRecord::Migration
  def self.up
    rename_column :fliers, :image_url, :image_uid
  end

  def self.down
    rename_column :fliers, :image_uid, :image_url
  end
end
