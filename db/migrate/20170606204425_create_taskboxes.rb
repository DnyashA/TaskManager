class CreateTaskboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :taskboxes do |t|
      t.string :name

      t.timestamps
    end
  end
end
