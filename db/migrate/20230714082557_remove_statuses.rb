# frozen_string_literal: true

class RemoveStatuses < ActiveRecord::Migration[6.1]
  def change
    remove_reference :projects, :status, null: true, foreign_key: true

    drop_table :statuses do |t|
      t.string :title
      t.string :background

      t.timestamps
    end
  end
end
