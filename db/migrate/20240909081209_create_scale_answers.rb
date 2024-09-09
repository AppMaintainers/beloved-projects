# frozen_string_literal: true

class CreateScaleAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :scale_answers do |t|
      t.integer :answer
      t.references :scale_question, null: false, foreign_key: true
      t.references :feedback, null: false, foreign_key: true

      t.timestamps
    end
  end
end
