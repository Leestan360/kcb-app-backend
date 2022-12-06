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

ActiveRecord::Schema[7.0].define(version: 2022_12_01_070537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "accountNo", null: false
    t.float "lastKnownBalance", null: false
    t.integer "accountType", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountNo"], name: "index_accounts_on_accountNo", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "uid", null: false
    t.string "deviceType", null: false
    t.datetime "lastSeen", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_devices_on_uid", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "permissions", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permissions"], name: "index_roles_on_permissions", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.string "uniqueReference", null: false
    t.integer "amount", null: false
    t.integer "status", default: 0, null: false
    t.integer "transactionType", default: 0, null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["uniqueReference"], name: "index_transactions_on_uniqueReference", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "users", "roles"
end
