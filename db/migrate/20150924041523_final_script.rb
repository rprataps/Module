class FinalScript < ActiveRecord::Migration
  def up

    create_table "books", force: :cascade do |t|

      t.text     "title"
      t.text     "description"
      t.string   "status"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.string   "author1"
      t.string   "author2"
      t.string   "author3"
      t.string   "author4"
      t.string   "author5"
    end

    create_table "checkouts", force: :cascade do |t|
      t.belongs_to :users, index: true
      t.belongs_to :books, index: true
      t.string   "checkout_date"
      t.string   "due_date"
      t.string   "returned"
      t.date     "return_date"
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
    end

    create_table "users", force: :cascade do |t|
      t.string   "email"
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.string   "password"
      t.string   "password_digest"
      t.string   "first_name"
      t.string   "middle_name"
      t.string   "last_name"
      t.string   "phone_number"
      t.string   "address_street"
      t.string   "address_house"
      t.string   "address_state"
      t.date     "expiry_date"
      t.string   "user_type"
    end
  end

  def down
    drop_table :users
    drop_table :checkouts
    drop_table :books
  end

end
