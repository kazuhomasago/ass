class CreateWhiteSpaces < ActiveRecord::Migration
  def change
    create_table :white_spaces do |t|
      t.integer :firm_staff_id
      t.date :date
      t.time :started_on
      t.time :ended_on

      t.timestamps null: false
    end
  end
end
