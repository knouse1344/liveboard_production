class RenameColumnAgainMyfliers < ActiveRecord::Migration
  def self.up
    rename_column :myfliers, :users_id, :user_id
    rename_column :myfliers, :fliers_id, :flier_id
  end

  def self.down
    rename_column :myfliers, :user_id, :users_id
    rename_column :myfliers, :flier_id, :fliers_id
  end
end
