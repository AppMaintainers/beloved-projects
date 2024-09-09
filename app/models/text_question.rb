# frozen_string_literal: true

class TextQuestion < ApplicationRecord
  belongs_to :form
  has_many :text_answers, dependent: :destroy

  validates :question, presence: true
  validates :order, presence: true
end
