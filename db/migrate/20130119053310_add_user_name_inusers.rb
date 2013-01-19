class AddUserNameInusers < ActiveRecord::Migration

  def change
    rename_column :users, :user_name, :first_name
    add_column :users, :last_name, :string
  end

end
