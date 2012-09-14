class CreateMyfliers < ActiveRecord::Migration
  def self.up
    create_table :myfliers do |t|
      t.integer :user_id
      t.integer :flier_id

      t.timestamps
    end
  end

  def self.down
    drop_table :myfliers
  end
end
