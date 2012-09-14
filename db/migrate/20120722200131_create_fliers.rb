class CreateFliers < ActiveRecord::Migration
  def change
    create_table :fliers do |t|
      t.string :title
      t.string :image_url
      t.string :tag
      t.string :description
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :category
      t.string :group
      t.integer :community_id

      t.timestamps
    end
  end
end
