# frozen_string_literal: true

class StringQuestion < ApplicationRecord
  belongs_to :from
  has_many :string_answers, dependent: :destroy

  validates :question, presence: true
  validates :order, presence: true
end
