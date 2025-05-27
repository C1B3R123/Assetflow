class CreateAssets < ActiveRecord::Migration[8.0]
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :asset_type
      t.text :description
      t.string :serial_number
      t.date :purchase_date
      t.decimal :purchase_price
      t.decimal :current_value
      t.integer :status
      t.text :notes

      t.timestamps
    end
  end
end
