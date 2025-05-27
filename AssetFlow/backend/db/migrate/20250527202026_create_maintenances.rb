class CreateMaintenances < ActiveRecord::Migration[8.0]
  def change
    create_table :maintenances do |t|
      t.references :asset, null: false, foreign_key: true
      t.date :maintenance_date
      t.text :description
      t.decimal :cost
      t.string :performed_by
      t.text :notes

      t.timestamps
    end
  end
end
