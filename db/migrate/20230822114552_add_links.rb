# frozen_string_literal: true

class AddLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.text :description
      t.references :project
      t.timestamps
    end
  end
end
