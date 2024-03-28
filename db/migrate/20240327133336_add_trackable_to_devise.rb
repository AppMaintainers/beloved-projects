# frozen_string_literal: true

class AddTrackableToDevise < ActiveRecord::Migration[6.1]
  class User < ApplicationRecord
  end

  def change
    change_table :users, bulk: true do |t|
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
    end

    User.update(last_sign_in_at: DateTime.now)
  end
end
