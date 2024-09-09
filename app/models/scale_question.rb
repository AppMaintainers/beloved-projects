# frozen_string_literal: true

class ScaleQuestion < ApplicationRecord
  belongs_to :from
  has_many :scale_answers, dependent: :destroy

  validates :question, presence: true
  validates :order, presence: true
  validates :minimum, presence: true
  validates :maximum, presence: true
end
