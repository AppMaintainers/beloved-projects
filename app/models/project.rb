class Project < ApplicationRecord
  has_and_belongs_to_many :maintainers, class_name: 'User', join_table: 'projects_users'
  has_many :accounts, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :title, presence: true
end
