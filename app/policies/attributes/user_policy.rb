# frozen_string_literal: true

module Attributes
  class UserPolicy < AttributePolicy
    def valid_admin?(next_value)
      if next_value
        user.admin? && !record.admin?
      else
        user == record && record.admin?
      end
    end
  end
end
