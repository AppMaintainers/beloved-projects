# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :projects_users, dependent: :destroy
  has_many :maintainers, class_name: 'User', foreign_key: 'user_id', through: :projects_users

  has_many :accounts, dependent: :destroy
  has_many :links, dependent: :destroy

  validates :title, presence: true
end
