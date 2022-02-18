class Project < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :status

  validates :status, presence: true
  validates :title, presence: true, allow_blank: false
end
