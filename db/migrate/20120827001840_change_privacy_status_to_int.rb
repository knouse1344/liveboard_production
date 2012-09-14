class ChangePrivacyStatusToInt < ActiveRecord::Migration
  def self.up
    remove_column :fliers, :privacy_status
    add_column :fliers, :privacy_status, :integer
  end

  def self.down
  end
end
