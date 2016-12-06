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

ActiveRecord::Schema.define(version: 20161127201435) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "name"
    t.string   "birth"
    t.string   "gender"
    t.string   "phone_number"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "tournament_id"
    t.string   "avatar"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "organizers", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "account_id"
    t.boolean  "admin"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "tournament_id"
    t.integer  "group_id"
    t.boolean  "checkin"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "stripe_token"
  end

  create_table "sponsors", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "name"
    t.string   "logo"
    t.string   "contact"
    t.string   "website"
    t.string   "business_phone_number"
    t.string   "business_email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "sponsor_id"
    t.integer  "tournament_id"
    t.integer  "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "stripe_token"
  end

  create_table "sub_admins", force: :cascade do |t|
    t.integer  "tournament_id"
    t.integer  "account_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.string   "venue"
    t.string   "logo"
    t.string   "details"
    t.string   "contact"
    t.boolean  "private"
    t.date     "date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "slots"
    t.integer  "ticket_price"
    t.integer  "ticket_price_guest"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "tournament_id"
    t.string   "amount"
    t.string   "stripe_token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
