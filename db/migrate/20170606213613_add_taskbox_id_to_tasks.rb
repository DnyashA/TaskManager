class AddTaskboxIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :taskbox_id, :integer
    add_index :tasks, :taskbox_id
  end
end
