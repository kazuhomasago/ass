class CreateAgencyStaffs < ActiveRecord::Migration
  def change
    create_table :agency_staffs do |t|
      t.string :name
      t.timestamp :deleted_at

      t.timestamps null: false
    end
  end
end
