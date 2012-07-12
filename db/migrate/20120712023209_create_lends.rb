class CreateLends < ActiveRecord::Migration
  def change
    create_table :lends do |t|
      t.integer :user_id
      t.string :item
      t.string :friend_name
      t.integer :friend_id

      t.timestamps
    end
    add_index :lends, :user_id
    add_index :lends, :friend_id
  end
end
