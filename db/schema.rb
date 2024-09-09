# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_09_09_081209) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain"
    t.string "organization"
    t.jsonb "services", default: [], null: false
    t.boolean "owner_request", default: false, null: false
    t.text "owner_request_notes"
    t.boolean "mfa_supported", default: false, null: false
    t.index ["project_id"], name: "index_accounts_on_project_id"
  end

  create_table "accounts_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.string "secret", limit: 12, default: -> { "\"left\"(md5((random())::text), 12)" }, null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_forms_on_project_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "title", null: false
    t.string "url", null: false
    t.text "description"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_links_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deactivated_at", precision: nil
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
  end

  create_table "scale_answers", force: :cascade do |t|
    t.integer "answer"
    t.bigint "scale_question_id", null: false
    t.bigint "feedback_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_id"], name: "index_scale_answers_on_feedback_id"
    t.index ["scale_question_id"], name: "index_scale_answers_on_scale_question_id"
  end

  create_table "scale_questions", force: :cascade do |t|
    t.string "question", null: false
    t.integer "order", null: false
    t.integer "minimum", default: 1, null: false
    t.integer "maximum", default: 10, null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_scale_questions_on_form_id"
  end

  create_table "select_answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "select_question_id", null: false
    t.bigint "feedback_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_id"], name: "index_select_answers_on_feedback_id"
    t.index ["select_question_id"], name: "index_select_answers_on_select_question_id"
  end

  create_table "select_questions", force: :cascade do |t|
    t.string "question", null: false
    t.integer "order", null: false
    t.jsonb "options", default: [], null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_select_questions_on_form_id"
  end

  create_table "string_answers", force: :cascade do |t|
    t.string "answer"
    t.bigint "string_question_id", null: false
    t.bigint "feedback_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_id"], name: "index_string_answers_on_feedback_id"
    t.index ["string_question_id"], name: "index_string_answers_on_string_question_id"
  end

  create_table "string_questions", force: :cascade do |t|
    t.string "question", null: false
    t.integer "order", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_string_questions_on_form_id"
  end

  create_table "text_answers", force: :cascade do |t|
    t.text "answer"
    t.bigint "text_question_id", null: false
    t.bigint "feedback_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feedback_id"], name: "index_text_answers_on_feedback_id"
    t.index ["text_question_id"], name: "index_text_answers_on_text_question_id"
  end

  create_table "text_questions", force: :cascade do |t|
    t.string "question", null: false
    t.integer "order", null: false
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_text_questions_on_form_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false, null: false
    t.datetime "deactivated_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "auto_gen_password", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "forms", "projects"
  add_foreign_key "scale_answers", "feedbacks"
  add_foreign_key "scale_answers", "scale_questions"
  add_foreign_key "scale_questions", "forms"
  add_foreign_key "select_answers", "feedbacks"
  add_foreign_key "select_answers", "select_questions"
  add_foreign_key "select_questions", "forms"
  add_foreign_key "string_answers", "feedbacks"
  add_foreign_key "string_answers", "string_questions"
  add_foreign_key "string_questions", "forms"
  add_foreign_key "text_answers", "feedbacks"
  add_foreign_key "text_answers", "text_questions"
  add_foreign_key "text_questions", "forms"
end
