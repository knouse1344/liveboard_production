class AddPrivacyColumn < ActiveRecord::Migration
  def self.up
    add_column :fliers, :privacy_status, :string
  end

  def self.down
    remove_column :fliers, :privacy_status, :string
  end
end
