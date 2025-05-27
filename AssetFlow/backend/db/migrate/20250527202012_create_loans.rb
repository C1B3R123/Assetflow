class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    create_table :loans do |t|
      t.references :asset, null: false, foreign_key: true
      t.string :loaned_to
      t.date :loan_date
      t.date :return_date
      t.date :expected_return_date
      t.boolean :returned
      t.text :notes

      t.timestamps
    end
  end
end
