class AddminMaxCoversInTable < ActiveRecord::Migration
  def change
    add_column :tables, :min_covers, :integer
    add_column :tables, :max_covers, :integer
  end
end
