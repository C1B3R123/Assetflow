class CreateLicenses < ActiveRecord::Migration[8.0]
  def change
    create_table :licenses do |t|
      t.references :asset, null: false, foreign_key: true
      t.string :key
      t.date :expiration_date
      t.string :issued_by
      t.text :notes

      t.timestamps
    end
  end
end
