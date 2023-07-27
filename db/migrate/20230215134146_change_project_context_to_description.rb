# frozen_string_literal: true

class ChangeProjectContextToDescription < ActiveRecord::Migration[6.1]
  def up
    rename_column :projects, :context, :description
  end

  def down
    rename_column :projects, :description, :context
  end
end
