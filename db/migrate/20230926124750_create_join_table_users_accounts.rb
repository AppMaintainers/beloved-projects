# frozen_string_literal: true

class CreateJoinTableUsersAccounts < ActiveRecord::Migration[6.1]
  class Account < ApplicationRecord
    has_and_belongs_to_many :account_managers, class_name: 'CreateJoinTableUsersAccounts::User', join_table: 'accounts_users'
    belongs_to :account_manager, class_name: 'CreateJoinTableUsersAccounts::User'
  end

  class User < ApplicationRecord
  end

  def up
    create_join_table :users, :accounts

    Account.find_each do |account|
      account.account_managers << account.account_manager
    end

    remove_reference :accounts, :account_manager, foreign_key: { to_table: :users }
  end

  def down
    add_reference :accounts, :account_manager, foreign_key: { to_table: :users }

    Account.find_each do |account|
      account.account_manager = account.account_managers.first
      account.save
    end

    drop_table :accounts_users
  end
end
