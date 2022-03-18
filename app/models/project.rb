class Project < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :status

  validates :title, presence: true
  validates :acquired_at, presence: true
end
