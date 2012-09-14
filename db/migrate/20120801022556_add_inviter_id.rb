class AddInviterId < ActiveRecord::Migration
  def self.up
    add_column :myfliers, :inviter_id, :integer
  end

  def self.down
    drop_column :myfliers
  end
end
