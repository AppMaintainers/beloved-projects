# frozen_string_literal: true

class DeactivatePolicy < ApplicationPolicy
  def destroy?
    (admin? && !record.admin?) || user == record
  end
end
