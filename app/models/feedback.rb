# frozen_string_literal: true

class Feedback < ApplicationRecord
  belongs_to :form
  has_many :string_answers, dependent: :destroy
  has_many :text_answers, dependent: :destroy
  has_many :select_answers, dependent: :destroy
  has_many :scale_answers, dependent: :destroy

  accepts_nested_attributes_for :string_answers,
                                :text_answers,
                                :select_answers,
                                :scale_answers
end
