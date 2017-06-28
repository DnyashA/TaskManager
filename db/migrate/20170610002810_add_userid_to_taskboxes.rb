class AddUseridToTaskboxes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :user_id, :integer
  	remove_column :users, :taskbox_id, :integer
  	add_column :taskboxes, :user_id, :integer
  	add_index :taskboxes, :user_id
  end
end
