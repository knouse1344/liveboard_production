class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :community_id

      t.timestamps
    end
  end
end
