# frozen_string_literal: true

class AddDeactivatedToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :deactivated_at, :datetime
  end
end
