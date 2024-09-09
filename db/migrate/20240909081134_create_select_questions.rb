# frozen_string_literal: true

class CreateSelectQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :select_questions do |t|
      t.string :question, null: false
      t.integer :order, null: false
      t.jsonb :options, null: false, default: []
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
