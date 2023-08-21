class Account < ApplicationRecord
  belongs_to :project
  belongs_to :account_manager, class_name: 'User'

  validates :name, presence: true
  validates :services, presence: true
  validates :owner_request, inclusion: { in: [true, false] }
end
