class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.timestamp :daleted_at

      t.timestamps null: false
    end
  end
end
