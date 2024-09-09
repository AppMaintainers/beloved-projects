# frozen_string_literal: true

class Feedback < ApplicationRecord
  has_many :sting_answers, dependent: :destroy
  has_many :text_answers, dependent: :destroy
  has_many :select_answers, dependent: :destroy
  has_many :scale_answers, dependent: :destroy
end
