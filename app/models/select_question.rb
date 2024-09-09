# frozen_string_literal: true

class SelectQuestion < ApplicationRecord
  belongs_to :form
  has_many :select_answers, dependent: :destroy

  validates :question, presence: true
  validates :order, presence: true
  validates :options, presence: true
end
