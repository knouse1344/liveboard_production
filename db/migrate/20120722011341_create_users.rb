class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :fbid
      t.string :fname
      t.string :lname
      t.string :image_url
      t.string :oauth_token
      t.string :oauth_exp
      t.integer :community_id

      t.timestamps
    end
  end
end
