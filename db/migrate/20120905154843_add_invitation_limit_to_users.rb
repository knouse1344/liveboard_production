class AddInvitationLimitToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :invitation_limit, :integer, :default => 10
  end

  def self.down
    
  end
end
