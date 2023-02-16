class Project < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :status
  has_many :accounts, dependent: :destroy

  validates :title, presence: true
  validates :acquired_at, presence: true
end
