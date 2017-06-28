class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :email
      t.integer :user_id
      t.integer :owner_id
      t.string :synonim
      t.timestamps
    end
    add_index :contacts, :user_id
    add_index :contacts, :owner_id
  end
end
