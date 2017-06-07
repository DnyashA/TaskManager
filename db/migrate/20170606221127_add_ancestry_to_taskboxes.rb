class AddAncestryToTaskboxes < ActiveRecord::Migration[5.0]
  def change
    add_column :taskboxes, :ancestry, :string
  end
end
