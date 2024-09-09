# frozen_string_literal: true

class CreateTextQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :text_questions do |t|
      t.string :question, null: false
      t.integer :order, null: false
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
