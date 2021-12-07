class CreateJoinTableUsersProjects < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :projects, column_options: { null: true }
  end
end
