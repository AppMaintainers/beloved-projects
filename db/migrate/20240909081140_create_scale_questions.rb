# frozen_string_literal: true

class CreateScaleQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :scale_questions do |t|
      t.string :question, null: false
      t.integer :order, null: false
      t.integer :minimum, null: false, default: 1
      t.integer :maximum, null: false, default: 10
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
