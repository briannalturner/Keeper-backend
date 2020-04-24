# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_24_190350) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "likee_id"
    t.integer "liker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.integer "year"
    t.string "gender"
    t.string "orientation"
    t.date "birthdate"
    t.boolean "likes_women"
    t.boolean "likes_men"
    t.boolean "likes_other"
    t.boolean "asexual"
    t.string "house", default: "Graduated"
    t.string "favorite_spell"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image", default: "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"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
