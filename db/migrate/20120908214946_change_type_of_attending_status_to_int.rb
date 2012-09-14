class ChangeTypeOfAttendingStatusToInt < ActiveRecord::Migration
  def self.up
    remove_column :myfliers, :attending_status
    add_column :myfliers, :attending_status, :integer
  end

  def self.down
  end
end
