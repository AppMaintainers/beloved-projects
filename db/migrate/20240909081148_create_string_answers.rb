# frozen_string_literal: true

class CreateStringAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :string_answers do |t|
      t.string :answer
      t.references :string_question, null: false, foreign_key: true
      t.references :feedback, null: false, foreign_key: true

      t.timestamps
    end
  end
end
