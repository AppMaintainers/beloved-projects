class Account < ApplicationRecord
  belongs_to :project
  belongs_to :account_manager, class_name: 'User'
end
