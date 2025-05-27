# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_27_202026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.integer "asset_type"
    t.text "description"
    t.string "serial_number"
    t.date "purchase_date"
    t.decimal "purchase_price"
    t.decimal "current_value"
    t.integer "status"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "licenses", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.string "key"
    t.date "expiration_date"
    t.string "issued_by"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_licenses_on_asset_id"
  end

  create_table "loans", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.string "loaned_to"
    t.date "loan_date"
    t.date "return_date"
    t.date "expected_return_date"
    t.boolean "returned"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_loans_on_asset_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.bigint "asset_id", null: false
    t.date "maintenance_date"
    t.text "description"
    t.decimal "cost"
    t.string "performed_by"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_maintenances_on_asset_id"
  end

  add_foreign_key "licenses", "assets"
  add_foreign_key "loans", "assets"
  add_foreign_key "maintenances", "assets"
end
