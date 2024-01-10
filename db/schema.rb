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

ActiveRecord::Schema[7.1].define(version: 2023_12_14_112105) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "counterparties", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "INN"
    t.string "email"
    t.string "post"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "lastname"
    t.string "name"
    t.string "patronymic"
    t.string "dr_license"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dr_license"], name: "index_drivers_on_dr_license", unique: true
  end

  create_table "fuels", force: :cascade do |t|
    t.date "date"
    t.integer "truck_id"
    t.decimal "fuel_l"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_f"
    t.index ["truck_id"], name: "index_fuels_on_truck_id"
  end

  create_table "reis_tables", force: :cascade do |t|
    t.bigint "counterparty_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "truck_id", null: false
    t.bigint "trailer_id", null: false
    t.string "loading"
    t.string "unloading"
    t.date "date_load"
    t.date "date_unload"
    t.string "cargo_name"
    t.decimal "km"
    t.decimal "rate"
    t.decimal "tonnage"
    t.boolean "nds"
    t.decimal "sum"
    t.date "due_date"
    t.date "invoice_date"
    t.date "letter_date"
    t.date "deadline"
    t.string "status"
    t.string "tracking_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counterparty_id"], name: "index_reis_tables_on_counterparty_id"
    t.index ["driver_id"], name: "index_reis_tables_on_driver_id"
    t.index ["trailer_id"], name: "index_reis_tables_on_trailer_id"
    t.index ["truck_id"], name: "index_reis_tables_on_truck_id"
  end

  create_table "salaries", force: :cascade do |t|
    t.bigint "driver_id", null: false
    t.date "salary_date"
    t.decimal "km_rate"
    t.decimal "reis"
    t.decimal "travel_allow"
    t.decimal "downtime"
    t.decimal "premium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_salaries_on_driver_id"
  end

  create_table "trailer_repairs", force: :cascade do |t|
    t.integer "trailer_id"
    t.date "date_repair"
    t.string "part_name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trailer_id"], name: "index_trailer_repairs_on_trailer_id"
  end

  create_table "trailers", force: :cascade do |t|
    t.string "car_number"
    t.string "model"
    t.string "trailer_type"
    t.integer "year"
    t.string "VIN"
    t.string "STS"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "truck_repairs", force: :cascade do |t|
    t.integer "truck_id"
    t.date "date_repair"
    t.string "part_name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["truck_id"], name: "index_truck_repairs_on_truck_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "car_number"
    t.string "model"
    t.integer "year"
    t.string "VIN"
    t.string "STS"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lastname"
    t.string "name"
    t.string "patronymic"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "fuels", "trucks"
  add_foreign_key "reis_tables", "counterparties"
  add_foreign_key "reis_tables", "drivers"
  add_foreign_key "reis_tables", "trailers"
  add_foreign_key "reis_tables", "trucks"
  add_foreign_key "salaries", "drivers"
  add_foreign_key "trailer_repairs", "trailers"
  add_foreign_key "truck_repairs", "trucks"
end
