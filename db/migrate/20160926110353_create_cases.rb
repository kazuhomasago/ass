class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :status
      t.string :title
      t.integer :agency_staff_id
      t.timestamp :deleted_at

      t.timestamps null: false
    end
  end
end
