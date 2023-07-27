class AddDateToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :acquired_at, :datetime
  end
end
