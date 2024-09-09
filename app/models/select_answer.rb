# frozen_string_literal: true

class SelectAnswer < ApplicationRecord
  belongs_to :feedback
  belongs_to :select_question
end
