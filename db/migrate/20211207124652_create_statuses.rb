# frozen_string_literal: true

class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :title
      t.string :background

      t.timestamps
    end
  end
end
