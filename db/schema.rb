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

ActiveRecord::Schema.define(version: 20160118212116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "gemfiles", force: :cascade do |t|
    t.string   "owner_name"
    t.text     "document"
    t.integer  "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_gemfiles_on_survey_id", using: :btree
  end

  create_table "gemfiles_gempackages", force: :cascade do |t|
    t.integer  "gemfile_id"
    t.integer  "gempackage_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["gemfile_id"], name: "index_gemfiles_gempackages_on_gemfile_id", using: :btree
    t.index ["gempackage_id"], name: "index_gemfiles_gempackages_on_gempackage_id", using: :btree
  end

  create_table "gempackages", force: :cascade do |t|
    t.string   "name"
    t.string   "website_url"
    t.string   "github_url"
    t.integer  "github_stars"
    t.datetime "last_github_check_at"
    t.datetime "last_rubygems_check_at"
    t.datetime "last_ruby_toolbox_check_at"
    t.integer  "category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["category_id"], name: "index_gempackages_on_category_id", using: :btree
    t.index ["name"], name: "index_gempackages_on_name", unique: true, using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "manager_email"
    t.string   "manager_token"
    t.string   "slug"
    t.string   "website_url"
    t.string   "logo"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "visible",       default: true
    t.index ["manager_token"], name: "index_groups_on_manager_token", using: :btree
    t.index ["name"], name: "index_groups_on_name", unique: true, using: :btree
    t.index ["slug"], name: "index_groups_on_slug", unique: true, using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.date     "closing_on"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.index ["code"], name: "index_surveys_on_code", unique: true, using: :btree
    t.index ["group_id"], name: "index_surveys_on_group_id", using: :btree
  end

  add_foreign_key "gemfiles", "surveys"
  add_foreign_key "gemfiles_gempackages", "gemfiles"
  add_foreign_key "gemfiles_gempackages", "gempackages"
  add_foreign_key "gempackages", "categories"
  add_foreign_key "surveys", "groups"
end
