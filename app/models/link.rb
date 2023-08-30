# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :services, presence: true
end
