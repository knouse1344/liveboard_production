class AddColumnToMyfliers < ActiveRecord::Migration
  def self.up
    add_column :myfliers, :attending_status, :string
  
  end

  def self.down
   remove_column :myfliers, :attending_status, :string
  end
end
