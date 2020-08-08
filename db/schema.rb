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

ActiveRecord::Schema.define(version: 2020_08_08_050258) do

  create_table "class_schedules", force: :cascade do |t|
    t.integer "teacher_class_id"
    t.integer "week_day", null: false
    t.integer "from", null: false
    t.integer "to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_class_id"], name: "index_class_schedules_on_teacher_class_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_connections_on_user_id"
  end

  create_table "teacher_classes", force: :cascade do |t|
    t.integer "user_id"
    t.string "subject", null: false
    t.float "cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teacher_classes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar", null: false
    t.string "whatsapp", null: false
    t.string "bio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
