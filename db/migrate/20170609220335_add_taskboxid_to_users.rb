class AddTaskboxidToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :taskbox_id, :integer
  	add_index :users, :taskbox_id
  end
end
