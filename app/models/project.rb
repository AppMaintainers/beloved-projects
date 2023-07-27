# frozen_string_literal: true

class Project < ApplicationRecord
  has_and_belongs_to_many :maintainers, class_name: 'User', join_table: 'projects_users'
  has_many :accounts, dependent: :destroy

  validates :title, presence: true
end
