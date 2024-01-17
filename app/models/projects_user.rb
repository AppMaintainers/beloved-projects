# frozen_string_literal: true

class ProjectsUser < ApplicationRecord
  belongs_to :project
  belongs_to :maintainer, class_name: 'User', foreign_key: 'user_id', inverse_of: :maintainers
end
