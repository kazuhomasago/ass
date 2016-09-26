class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :name
      t.timestamp :deleted_at

      t.timestamps null: false
    end
  end
end
