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

ActiveRecord::Schema.define(version: 20150530082423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_laws", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "average_salaries", force: true do |t|
    t.decimal  "net",        precision: 15, scale: 2, default: 0.0
    t.decimal  "gross",      precision: 15, scale: 2, default: 0.0
    t.string   "country"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expense_categories", force: true do |t|
    t.string   "name"
    t.string   "nice_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.integer  "expense_category_id"
    t.decimal  "price",               precision: 15, scale: 2, default: 0.0
    t.string   "currency",                                     default: "EUR", null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "spended_at"
    t.integer  "payment_id"
  end

  create_table "images", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "invoice_items", force: true do |t|
    t.integer  "invoice_id"
    t.string   "description"
    t.decimal  "price",       precision: 15, scale: 2, default: 0.0
    t.string   "currency",                             default: "EUR", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "discount",                             default: false, null: false
  end

  create_table "invoices", force: true do |t|
    t.integer  "project_id"
    t.decimal  "price",                precision: 15, scale: 2, default: 0.0
    t.string   "currency",                                      default: "EUR", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "our_company_id"
    t.string   "invoice_number"
    t.datetime "sent_at"
    t.boolean  "storno",                                        default: false, null: false
    t.integer  "due_days"
    t.string   "status"
    t.datetime "service_delivered_at"
    t.integer  "additional_law_id"
    t.string   "before_table_text"
  end

  create_table "minimum_salaries", force: true do |t|
    t.decimal  "net",        precision: 15, scale: 2, default: 0.0
    t.decimal  "gross",      precision: 15, scale: 2, default: 0.0
    t.string   "country"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oauths", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauths", ["provider", "uid"], name: "index_oauths_on_provider_and_uid", using: :btree

  create_table "our_companies", force: true do |t|
    t.string   "name"
    t.string   "reference_number"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "trr"
    t.string   "bank"
    t.string   "swift_bic_code"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_number"
    t.string   "vat_number"
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "published_at"
    t.string   "status"
    t.boolean  "visible_in_menu"
  end

  create_table "partners", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "country"
    t.string   "attention_to"
    t.string   "vat_number"
    t.string   "vat"
    t.text     "footer_text"
  end

  create_table "payments", force: true do |t|
    t.integer  "project_id"
    t.integer  "our_company_id"
    t.integer  "invoice_id"
    t.decimal  "price",          precision: 15, scale: 2, default: 0.0
    t.string   "currency",                                default: "EUR", null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "payed_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "content"
    t.string   "url"
    t.string   "itunes_url"
    t.string   "google_url"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "partner_id"
  end

  add_index "projects", ["created_at"], name: "index_projects_on_created_at", using: :btree
  add_index "projects", ["status"], name: "index_projects_on_status", using: :btree

  create_table "scrum_tasks", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "description"
    t.time     "time_to_do"
    t.time     "time_used"
    t.string   "not_finished_or_overtime_justification"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scrum_id"
    t.integer  "hours_planned",                          default: 0
    t.integer  "minutes_planned",                        default: 0
    t.integer  "hours_used",                             default: 0
    t.integer  "minutes_used",                           default: 0
  end

  create_table "scrums", force: true do |t|
    t.date     "date"
    t.time     "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "deleted",         default: false, null: false
    t.boolean  "enabled",         default: true,  null: false
  end

  create_table "vacations", force: true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.date     "end_date"
    t.float    "days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
  end

  create_table "wanted_salaries", force: true do |t|
    t.decimal  "net",        precision: 15, scale: 2, default: 0.0
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
