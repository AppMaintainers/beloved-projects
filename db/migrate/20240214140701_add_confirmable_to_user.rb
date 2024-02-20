# frozen_string_literal: true

class AddConfirmableToUser < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
      t.index :confirmation_token, unique: true
    end

    User.update(confirmed_at: DateTime.now)
  end
end
