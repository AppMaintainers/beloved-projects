# frozen_string_literal: true

class ScaleAnswer < ApplicationRecord
  belongs_to :feedback
  belongs_to :scale_question
end
