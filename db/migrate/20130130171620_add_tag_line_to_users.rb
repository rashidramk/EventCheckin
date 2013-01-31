class AddTagLineToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tag_line, :text
  end
end
