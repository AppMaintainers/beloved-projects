# frozen_string_literal: true

class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :description
      t.references :project
      t.timestamps
    end
  end
end
