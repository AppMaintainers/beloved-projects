# frozen_string_literal: true

class CreateTextAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :text_answers do |t|
      t.text :answer
      t.references :text_question, null: false, foreign_key: true
      t.references :feedback, null: false, foreign_key: true

      t.timestamps
    end
  end
end
