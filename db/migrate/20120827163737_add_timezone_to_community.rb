class AddTimezoneToCommunity < ActiveRecord::Migration
  def self.up
    add_column :communities, :timezone, :string
  end

  def self.down
    remove_column :communities, :timezone
  end
end
