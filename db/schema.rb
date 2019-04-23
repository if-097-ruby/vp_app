ActiveRecord::Schema.define(version: 2019_04_22_184900) do
  
  enable_extension "plpgsql"

  create_table "device_groups", force: :cascade do |t|
    t.string "name"
    t.integer "organization
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.string "device_type"
    t.integer "device_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "password_confirmation"
    t.boolean "admin"
    t.integer "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
end
