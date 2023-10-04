# frozen_string_literal: true

class CreateJoinTableUsersProjects < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :projects
  end
end
