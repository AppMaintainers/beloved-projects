# frozen_string_literal: true

class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.string :title, null: false
      t.string :description
      t.string :secret, limit: 12, null: false
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
