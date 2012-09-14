class AddScoreToMyfliersAndDropSomeIrrelevantColumns < ActiveRecord::Migration
  def self.up
    add_column :myfliers, :myscore, :numeric
    remove_column :fliers, :category
  end

  def self.down
    remove_column :myfliers, :myscore, :numeric
    add_column :fliers, :category
  end
end
