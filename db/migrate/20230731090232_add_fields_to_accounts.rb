# frozen_string_literal: true

class AddFieldsToAccounts < ActiveRecord::Migration[6.1]
  def change
    change_table :accounts, bulk: true do |t|
      t.string :domain
      t.string :organization
      t.jsonb  :services, default: []
      t.references :account_manager, foreign_key: { to_table: :users }
      t.boolean :owner_request, null: false, default: false
      t.text :owner_request_notes
      t.boolean :mfa_supported, null: false, default: false
    end
  end
end
