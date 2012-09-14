class CreateOrganizationFliers < ActiveRecord::Migration
  def self.up
    create_table :organization_fliers do |t|
      t.integer :organization_id
      t.integer :flier_id
      t.integer :attending_status

      t.timestamps
    end
  end
end
