# frozen_string_literal: true

class RemoveProjectDescriptionAndAcquiredAt < ActiveRecord::Migration[6.1]
  def change
    # rubocop:disable Rails/BulkChangeTable
    remove_column :projects, :description, :text
    remove_column :projects, :acquired_at, :datetime
    # rubocop:enable Rails/BulkChangeTable
  end
end
