class AddStatusToProject < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :status, null: true, foreign_key: true
  end
end
