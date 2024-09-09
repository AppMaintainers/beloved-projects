# frozen_string_literal: true

class StringAnswer < ApplicationRecord
  belongs_to :feedback
  belongs_to :string_question
end
