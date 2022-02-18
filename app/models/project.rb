class Project < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :status, optional: true

  validates :status, presence: true
end
