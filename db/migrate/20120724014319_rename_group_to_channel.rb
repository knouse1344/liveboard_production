class RenameGroupToChannel < ActiveRecord::Migration
  def self.up
    rename_column :fliers, :group, :channel_id
  end

  def self.down
    rename_column :fliers, :channel_id, :group
  end
end
