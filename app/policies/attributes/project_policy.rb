# frozen_string_literal: true

module Attributes
  class ProjectPolicy < AttributePolicy
    def valid_deactivated_at?(_)
      admin?
    end
  end
end
