# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180724053154) do

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.float    "opening_balance"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "phone"
    t.string   "website"
    t.string   "user_id"
    t.string   "sale_id"
    t.string   "purchase_id"
    t.string   "transaction_id"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "financial_transactions", force: :cascade do |t|
    t.date     "date"
    t.string   "description"
    t.string   "reference"
    t.integer  "project_id"
    t.integer  "contact_id"
    t.float    "vat_amount"
    t.integer  "transaction_type", default: 0
    t.integer  "payment_entry_id"
    t.boolean  "payment"
    t.integer  "receipt_entry_id"
    t.integer  "gl_account_id"
    t.integer  "vat_type",         default: 0
    t.integer  "bank_account_id"
    t.float    "total_amount"
    t.integer  "purchase_id"
    t.integer  "sale_id"
    t.float    "net_amount"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
  end

  create_table "gl_accounts", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.integer  "account_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.string   "description"
    t.float    "amount"
    t.integer  "account_id"
    t.boolean  "debit"
    t.boolean  "credit"
    t.date     "date"
    t.integer  "user_id"
    t.integer  "journal_id"
    t.integer  "gl_account_id"
    t.boolean  "current_liability"
    t.boolean  "non_current_liability"
    t.boolean  "equity"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string   "description"
    t.date     "date"
    t.string   "reference"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payment_entries", force: :cascade do |t|
    t.integer  "transaction_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "financial_transaction_id"
    t.integer  "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.string   "tag"
    t.float    "price"
    t.float    "quantity"
    t.integer  "purchase_entry_id"
    t.integer  "sale_entry_id"
    t.float    "opening_stock"
    t.float    "current_stock"
    t.integer  "user_id"
    t.integer  "code"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "company"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "post_code"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "purchase_entries", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "description"
    t.integer  "account_id"
    t.float    "quantity"
    t.float    "price"
    t.integer  "total_price"
    t.integer  "purchase_id"
    t.integer  "user_id"
    t.integer  "gl_account_id"
    t.integer  "vat_type",      default: 0
    t.float    "vat_amount"
    t.float    "net_price"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "invoice_number"
    t.integer  "contact_id"
    t.date     "date"
    t.text     "notes"
    t.integer  "purchases_type"
    t.integer  "user_id"
    t.float    "amount"
    t.integer  "puchase_id"
    t.float    "balance"
    t.float    "vat_amount"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "receipt_entries", force: :cascade do |t|
    t.integer  "transaction_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "financial_transaction_id"
    t.integer  "user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "number"
    t.string   "title"
    t.string   "address"
    t.date     "date"
    t.date     "due_date"
    t.float    "vat_total"
    t.float    "amount"
    t.text     "notes"
    t.integer  "customer_id"
    t.integer  "type"
    t.integer  "user_id"
    t.integer  "sale_id"
    t.integer  "contact_id"
    t.integer  "sales_type"
    t.integer  "invoice_number"
    t.float    "balance"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sales_entries", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "description"
    t.float    "quantity"
    t.float    "price"
    t.integer  "vat_type",      default: 0
    t.integer  "account_id"
    t.integer  "total_price"
    t.integer  "sale_id"
    t.integer  "gl_account_id"
    t.float    "vat_amount"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.float    "net_price"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
