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

ActiveRecord::Schema.define(version: 20160115112036) do

  create_table "element_attributes", force: :cascade do |t|
    t.string   "name"
    t.text     "definition"
    t.text     "constraint"
    t.string   "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elements", force: :cascade do |t|
    t.string   "name"
    t.string   "eName"
    t.text     "definition"
    t.string   "identifier"
    t.text     "definedBy"
    t.string   "label"
    t.string   "language"
    t.string   "occurence"
    t.string   "keyWords"
    t.string   "version"
    t.string   "comments"
    t.integer  "spec_id"
    t.integer  "encodingScheme_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "elements", ["encodingScheme_id"], name: "index_elements_on_encodingScheme_id"
  add_index "elements", ["spec_id"], name: "index_elements_on_spec_id"

  create_table "encoding_schemes", force: :cascade do |t|
    t.string   "name"
    t.string   "eName"
    t.text     "definition"
    t.string   "identifier"
    t.text     "definedBy"
    t.string   "label"
    t.string   "language"
    t.string   "occurence"
    t.string   "keyWords"
    t.string   "version"
    t.string   "comments"
    t.integer  "spec_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "encoding_schemes", ["spec_id"], name: "index_encoding_schemes_on_spec_id"

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["tenant_id"], name: "index_members_on_tenant_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "members_roles", id: false, force: :cascade do |t|
    t.integer "member_id"
    t.integer "role_id"
  end

  add_index "members_roles", ["member_id", "role_id"], name: "index_members_roles_on_member_id_and_role_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "action"
    t.string   "subject"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "permissions_roles", id: false, force: :cascade do |t|
    t.integer "permission_id"
    t.integer "role_id"
  end

  add_index "permissions_roles", ["permission_id", "role_id"], name: "index_permissions_roles_on_permission_id_and_role_id", using: :btree
  add_index "permissions_roles", ["role_id", "permission_id"], name: "index_permissions_roles_on_role_id_and_permission_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "member_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "posts", ["member_id"], name: "index_posts_on_member_id", using: :btree

  create_table "refined_bies", force: :cascade do |t|
    t.string   "name"
    t.string   "eName"
    t.text     "definition"
    t.string   "identifier"
    t.text     "definedBy"
    t.string   "label"
    t.string   "language"
    t.string   "occurence"
    t.string   "keyWords"
    t.string   "version"
    t.string   "comments"
    t.integer  "spec_id"
    t.integer  "encodingScheme_id"
    t.integer  "element_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "refined_bies", ["element_id"], name: "index_refined_bies_on_element_id"
  add_index "refined_bies", ["encodingScheme_id"], name: "index_refined_bies_on_encodingScheme_id"
  add_index "refined_bies", ["spec_id"], name: "index_refined_bies_on_spec_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "spec_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specs", force: :cascade do |t|
    t.string   "name"
    t.text     "limit"
    t.text     "normative"
    t.text     "termDefinition"
    t.text     "elementSetExp"
    t.text     "metadataStructure"
    t.string   "version"
    t.integer  "state"
    t.string   "annotation"
    t.datetime "releaseDate"
    t.integer  "SpecCategory_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "specs", ["SpecCategory_id"], name: "index_specs_on_SpecCategory_id"

  create_table "template_element_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "detail"
    t.string   "version"
    t.integer  "state"
    t.string   "annotion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "template_elements", force: :cascade do |t|
    t.string   "name"
    t.string   "eName"
    t.text     "definition"
    t.string   "identifier"
    t.text     "definedBy"
    t.string   "label"
    t.string   "language"
    t.string   "occurence"
    t.string   "keyWords"
    t.string   "version"
    t.string   "comments"
    t.integer  "templateElementCategory_id"
    t.integer  "templateEncodingScheme_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "template_elements", ["templateElementCategory_id"], name: "index_template_elements_on_templateElementCategory_id"

  create_table "template_encoding_schemes", force: :cascade do |t|
    t.string   "name"
    t.string   "eName"
    t.text     "definition"
    t.string   "identifier"
    t.text     "definedBy"
    t.string   "label"
    t.string   "language"
    t.string   "occurence"
    t.string   "keyWords"
    t.string   "version"
    t.string   "comments"
    t.integer  "templateElementCategory_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "template_encoding_schemes", ["templateElementCategory_id"], name: "index_template_encoding_schemes_on_templateElementCategory_id"

  create_table "template_refined_bies", force: :cascade do |t|
    t.string   "name"
    t.string   "eName"
    t.text     "definition"
    t.string   "identifier"
    t.text     "definedBy"
    t.string   "label"
    t.string   "language"
    t.string   "occurence"
    t.string   "keyWords"
    t.string   "version"
    t.string   "comments"
    t.integer  "templateElementCategory_id"
    t.integer  "templateEncodingScheme_id"
    t.integer  "templateElement_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "template_refined_bies", ["templateElementCategory_id"], name: "index_template_refined_bies_on_templateElementCategory_id"
  add_index "template_refined_bies", ["templateElement_id"], name: "index_template_refined_bies_on_templateElement_id"
  add_index "template_refined_bies", ["templateEncodingScheme_id"], name: "index_template_refined_bies_on_templateEncodingScheme_id"

  create_table "tenants", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tenants", ["name"], name: "index_tenants_on_name", using: :btree
  add_index "tenants", ["tenant_id"], name: "index_tenants_on_tenant_id", using: :btree

  create_table "tenants_users", id: false, force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "tenants_users", ["tenant_id", "user_id"], name: "index_tenants_users_on_tenant_id_and_user_id", using: :btree

  create_table "uploads", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "skip_confirm_change_password", default: false
    t.integer  "tenant_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "members", "tenants"
  add_foreign_key "members", "users"
  add_foreign_key "posts", "members"
  add_foreign_key "tenants", "tenants"
end
