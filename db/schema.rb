# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171216233645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "housings", force: :cascade do |t|
    t.string "city"
    t.integer "beds"
    t.string "length_of_stay"
    t.boolean "child_friendly"
    t.text "kid_notes"
    t.boolean "pets_accepted"
    t.text "pet_notes"
    t.string "contact_name"
    t.string "phone_number"
    t.string "email_address"
    t.text "notes"
    t.integer "user_id"
    t.string "status", default: "available"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid"
    t.string "neighborhood"
    t.string "housing_type"
    t.boolean "has_animals"
    t.string "price"
  end

  create_table "supplies_neededs", force: :cascade do |t|
    t.string "organization"
    t.string "drop_off_location"
    t.string "phone_number"
    t.string "drop_off_hours"
    t.string "email_address"
    t.string "direct_donations"
    t.string "items"
    t.string "special_instructions"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_taggables", force: :cascade do |t|
    t.integer "taggable_id"
    t.string "taggable_type"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_sent_at"
    t.string "phone_number"
    t.string "username"
    t.boolean "verified", default: false
    t.string "role", default: "user"
    t.integer "pin"
    t.string "password_digest"
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "volunteers", force: :cascade do |t|
    t.text "skills"
    t.integer "number_of_volunteers"
    t.text "volunteers_notes"
    t.string "organization"
    t.string "address"
    t.string "coordinates"
    t.string "contact_name"
    t.string "phone_number"
    t.string "email_address"
    t.string "additional_information"
    t.integer "user_id"
    t.string "status", default: "available"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
