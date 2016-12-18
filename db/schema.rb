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

ActiveRecord::Schema.define(version: 20161205233018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone"
    t.string   "shipping_account_number"
    t.string   "shipping_service"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "organization_id"
    t.index ["organization_id"], name: "index_addresses_on_organization_id", using: :btree
  end

  create_table "contact_actions", force: :cascade do |t|
    t.integer  "created_by_id",   null: false
    t.string   "action"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "contact_id"
    t.integer  "organization_id"
    t.index ["contact_id"], name: "index_contact_actions_on_contact_id", using: :btree
    t.index ["organization_id"], name: "index_contact_actions_on_organization_id", using: :btree
  end

  create_table "contact_methods", force: :cascade do |t|
    t.string   "label",      null: false
    t.string   "value",      null: false
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contact_id"
    t.index ["contact_id"], name: "index_contact_methods_on_contact_id", using: :btree
  end

  create_table "contact_organizations", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["contact_id"], name: "index_contact_organizations_on_contact_id", using: :btree
    t.index ["organization_id"], name: "index_contact_organizations_on_organization_id", using: :btree
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.text     "general_notes"
    t.boolean  "hidden",                  default: false
    t.string   "hidden_reason"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "do_not_call",             default: false
    t.integer  "do_not_call_added_by_id"
    t.datetime "do_not_call_added_at"
    t.string   "grad_year"
  end

  create_table "event_organizations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "organization_id"
    t.string   "status"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["event_id"], name: "index_event_organizations_on_event_id", using: :btree
    t.index ["organization_id"], name: "index_event_organizations_on_organization_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "date",            null: false
    t.string   "name",            null: false
    t.text     "description"
    t.integer  "estimated_value"
    t.integer  "likelihood"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "follow_ups", force: :cascade do |t|
    t.datetime "follow_up_date",                  null: false
    t.integer  "follow_up_by_id",                 null: false
    t.string   "type"
    t.text     "description"
    t.boolean  "hidden",          default: false
    t.datetime "hidden_at"
    t.integer  "created_by_id",                   null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "contact_id"
    t.integer  "organization_id"
    t.index ["contact_id"], name: "index_follow_ups_on_contact_id", using: :btree
    t.index ["organization_id"], name: "index_follow_ups_on_organization_id", using: :btree
  end

  create_table "organization_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "organization_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "organization_desc_idx", using: :btree
  end

  create_table "organization_reps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.string   "role"
    t.datetime "assigned_at"
    t.datetime "removed_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["organization_id"], name: "index_organization_reps_on_organization_id", using: :btree
    t.index ["user_id"], name: "index_organization_reps_on_user_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",                                     null: false
    t.string   "code",                                     null: false
    t.text     "general_notes"
    t.integer  "organization_size"
    t.datetime "info_last_updated_at"
    t.integer  "payment_terms",            default: 0
    t.boolean  "credit_approved",          default: false
    t.datetime "credit_status_updated_at"
    t.text     "credit_status_notes"
    t.integer  "credit_amount"
    t.boolean  "credit_probation",         default: false
    t.boolean  "po_required",              default: false
    t.boolean  "w9_on_file",               default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "term_type"
    t.datetime "fall_start_date"
    t.datetime "winter_start_date"
    t.datetime "spring_start_date"
    t.text     "colors"
    t.text     "mascot"
    t.decimal  "percent_greek"
    t.text     "campus_notes"
    t.integer  "type",                     default: 0
    t.integer  "parent_id"
    t.integer  "tree_sort_order"
    t.string   "sti_type"
  end

  create_table "resale_certificates", force: :cascade do |t|
    t.datetime "effective_date",  null: false
    t.datetime "end_date",        null: false
    t.string   "state",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
    t.index ["organization_id"], name: "index_resale_certificates_on_organization_id", using: :btree
  end

  create_table "social_media_connections", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "url",             null: false
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
    t.index ["organization_id"], name: "index_social_media_connections_on_organization_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tag_id", "taggable_id", "taggable_type"], name: "index_taggings_on_tag_id_and_taggable_id_and_taggable_type", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "uid"
    t.string   "provider"
    t.integer  "kotisauth_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "organizations"
  add_foreign_key "contact_actions", "contacts"
  add_foreign_key "contact_actions", "organizations"
  add_foreign_key "contact_methods", "contacts"
  add_foreign_key "contact_organizations", "contacts"
  add_foreign_key "contact_organizations", "organizations"
  add_foreign_key "event_organizations", "events"
  add_foreign_key "event_organizations", "organizations"
  add_foreign_key "follow_ups", "contacts"
  add_foreign_key "follow_ups", "organizations"
  add_foreign_key "organization_reps", "organizations"
  add_foreign_key "organization_reps", "users"
  add_foreign_key "resale_certificates", "organizations"
  add_foreign_key "social_media_connections", "organizations"
  add_foreign_key "taggings", "tags"
end
