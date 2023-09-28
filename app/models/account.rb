class Account < ApplicationRecord
  belongs_to :project
  has_and_belongs_to_many :account_managers, class_name: 'User', join_table: 'accounts_users'

  validates :name, presence: true
  validates :services, presence: true
  validates :owner_request, inclusion: { in: [true, false] }
  validates :account_managers, presence: true
end
