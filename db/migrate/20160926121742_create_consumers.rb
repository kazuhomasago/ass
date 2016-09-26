class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :tel1
      t.string :tel2
      t.integer :gender
      t.string :zip_code
      t.string :prefecture
      t.string :address1
      t.string :address2
      t.string :address3
      t.timestamps :deleted_at

      t.timestamps null: false
    end
  end
end
