class CreateMortgageDetails < ActiveRecord::Migration
  def change
    create_table :mortgage_details do |t|
      t.integer :amount
      t.text :remarkes

      t.timestamps null: false
    end
  end
end
