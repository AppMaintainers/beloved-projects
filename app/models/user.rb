# frozen_string_literal: true

class User < ApplicationRecord
  has_many :projects_users, dependent: :destroy
  has_many :projects, through: :projects_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :admin, inclusion: { in: [true, false] }
end
