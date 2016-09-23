class CreateFirmStaffs < ActiveRecord::Migration
  def change
    create_table :firm_staffs do |t|
      t.string :name
      t.timestamp :deleted_at

      t.timestamps null: false
    end
  end
end
