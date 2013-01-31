class CreateProfileImages < ActiveRecord::Migration
  def change
    create_table :profile_images do |t|
      t.string :image_for
      t.integer :user_id

      t.timestamps
    end
  end
end
