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

    def valid_deactivated_at?(next_value)
      if next_value.present?
        (admin? && !record.admin?) || user == record
      else
        false
      end
    end
  end
end
