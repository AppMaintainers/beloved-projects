# frozen_string_literal: true

class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks, &:timestamps
  end
end
