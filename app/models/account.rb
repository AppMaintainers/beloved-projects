class Account < ApplicationRecord
  belongs_to :project
  belongs_to :account_manager, class_name: 'User'

  validates :name, presence: true
  validates :services, presence: true, allow_nil: false
  validates :account_manager_id, allow_nil: false
  validates :owner_request, presence: true, allow_nil: false
end
