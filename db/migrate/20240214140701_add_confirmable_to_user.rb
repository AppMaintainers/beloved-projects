# frozen_string_literal: true

class AddConfirmableToUser < ActiveRecord::Migration[6.1]
  def up
    change_table :users, bulk: true do |t|
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
    end
    add_index :users, :confirmation_token, unique: true

    User.update(confirmed_at: DateTime.now)
  end

  def down
    remove_index :users, :confirmation_token
    change_table :users, bulk: true do |t|
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
    end
  end
end
