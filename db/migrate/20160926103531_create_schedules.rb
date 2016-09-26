class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :whitespace_id
      t.integer :case_id

      t.timestamps null: false
    end
  end
end
