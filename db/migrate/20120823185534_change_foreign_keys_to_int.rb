class ChangeForeignKeysToInt < ActiveRecord::Migration
  def self.up
    
      remove_column :fliers, :channel_id
      add_column :fliers, :channel_id, :integer
    end
  end

  def self.down
    change_table :fliers do |t|
      t.change :channel_id, :string
    end
  end

