class AddAttachmentImageToProfileImages < ActiveRecord::Migration
  def self.up
    change_table :profile_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :profile_images, :image
  end
end
