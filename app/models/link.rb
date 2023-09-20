# frozen_string_literal: true

class Link < ApplicationRecord
  belongs_to :project

  validates :title, presence: true
  validates :url, presence: true, format: { with: %r{\A(http:|https:)//[^.]+\..*\z} }
end
