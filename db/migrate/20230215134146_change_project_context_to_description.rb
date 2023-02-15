class ChangeProjectContextToDescription < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :projects, :context, :description
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end

  def self.down
    rename_column :projects, :description, :context
  end
end
