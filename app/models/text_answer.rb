# frozen_string_literal: true

class TextAnswer < ApplicationRecord
  belongs_to :feedback
  belongs_to :text_question
end
