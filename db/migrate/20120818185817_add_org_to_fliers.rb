class AddOrgToFliers < ActiveRecord::Migration
  def self.up
    add_column :fliers, :org_creator_id, :integer
  end

  def self.down
    remove_column :fliers, :org_creator_id
  end
end
