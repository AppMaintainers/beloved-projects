# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.references :form, null: false, foreign_key: true

      t.timestamps
    end
  end
end
