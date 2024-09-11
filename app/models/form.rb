# frozen_string_literal: true

class Form < ApplicationRecord
  attr_readonly :secret

  belongs_to :project
  has_many :string_questions, dependent: :destroy
  has_many :text_questions, dependent: :destroy
  has_many :select_questions, dependent: :destroy
  has_many :scale_questions, dependent: :destroy

  validates :title, presence: true
  validates :secret, presence: true, length: { is: 12 }
end
