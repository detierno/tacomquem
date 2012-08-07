class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :lend_id
      t.date :due_in

      t.timestamps
    end
    add_index :reminders, :lend_id
  end
end
