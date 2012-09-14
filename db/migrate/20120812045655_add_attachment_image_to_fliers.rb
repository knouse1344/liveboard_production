class AddAttachmentImageToFliers < ActiveRecord::Migration
  def self.up
    change_table :fliers do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :fliers, :image
  end
end
